package com.example.employee.service;

import com.example.employee.model.AttendanceLog;
import com.example.employee.model.EacOvertimeRequest;
import com.example.employee.model.OfficialEmployee;
import com.example.employee.model.OvertimeDisplayRow;
import com.example.employee.repository.AttendanceRepository;
import com.example.employee.repository.EacOvertimeRequestRepository;
import com.example.employee.repository.OfficialEmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class OvertimeRequestService {

    @Value("${app.upload.overtime-dir:uploads/overtime-attachments}")
    private String overtimeUploadDir;

    @Autowired
    private EacOvertimeRequestRepository eacOvertimeRequestRepository;

    @Autowired
    private AttendanceRepository attendanceRepository;

    @Autowired
    private OfficialEmployeeRepository officialEmployeeRepository;

    public record OvertimeMonthStats(long pending, long approved, long rejected, long total) {}

    public OvertimeMonthStats getStatsForEmployeeMonth(String employeeId, YearMonth ym) {
        LocalDate a = ym.atDay(1);
        LocalDate b = ym.atEndOfMonth();
        List<OvertimeDisplayRow> list = buildEmployeeList(employeeId, a, b);
        long p = 0, ap = 0, rj = 0;
        for (OvertimeDisplayRow row : list) {
            String s = row.status() != null ? row.status() : "";
            if (s.toLowerCase().contains("pend")) {
                p++;
            } else if (s.toLowerCase().contains("appr")) {
                ap++;
            } else if (s.toLowerCase().contains("reject")) {
                rj++;
            }
        }
        return new OvertimeMonthStats(p, ap, rj, list.size());
    }

    public OvertimeMonthStats getStatsForMonth(YearMonth ym) {
        return getStatsForDateRange(ym.atDay(1), ym.atEndOfMonth());
    }

    public OvertimeMonthStats getStatsForDateRange(LocalDate from, LocalDate to) {
        if (from == null || to == null || from.isAfter(to)) {
            return new OvertimeMonthStats(0, 0, 0, 0);
        }
        long pe = eacOvertimeRequestRepository.countByStatusAndWorkDateBetween("PENDING", from, to);
        long ae = eacOvertimeRequestRepository.countByStatusAndWorkDateBetween("APPROVED", from, to);
        long re = eacOvertimeRequestRepository.countByStatusAndWorkDateBetween("REJECTED", from, to);

        long pt = attendanceRepository.countTcmsOvertimePendingMonth(from, to);
        long at = attendanceRepository.countTcmsOvertimeApprovedMonth(from, to);
        long rt = attendanceRepository.countTcmsOvertimeRejectedMonth(from, to);

        long pending = pe + pt;
        long approved = ae + at;
        long rejected = re + rt;
        long total = pending + approved + rejected;
        return new OvertimeMonthStats(pending, approved, rejected, total);
    }

    public List<OvertimeDisplayRow> buildAdminList(LocalDate from, LocalDate to) {
        if (from == null || to == null || from.isAfter(to)) {
            return List.of();
        }
        List<OvertimeDisplayRow> rows = new ArrayList<>();

        for (AttendanceLog log : attendanceRepository.findOvertimeRelatedInDateRange(from, to)) {
            Optional<OfficialEmployee> op = parseEmployee(log.getEmployeeId());
            if (op.isEmpty()) {
                continue;
            }
            OfficialEmployee emp = op.get();
            String st = log.getOtApprovalStatus() != null ? log.getOtApprovalStatus().trim() : "NONE";
            if ("NONE".equalsIgnoreCase(st) && (log.getOvertimeReported() == null || log.getOvertimeReported() <= 0)
                && (log.getOvertimeHours() == null || log.getOvertimeHours() <= 0)) {
                continue;
            }
            int rpt = log.getOvertimeReported() != null ? log.getOvertimeReported() : 0;
            int pay = log.getOvertimeHours() != null ? log.getOvertimeHours() : 0;
            String hrs = formatOtHoursLabel(rpt, pay);
            String statusLabel = "PENDING".equalsIgnoreCase(st) ? "Pending"
                : ("APPROVED".equalsIgnoreCase(st) ? "Approved" : ("REJECTED".equalsIgnoreCase(st) ? "Rejected" : st));
            rows.add(new OvertimeDisplayRow(
                "TCMS-" + log.getId(),
                "TCMS / biometrics",
                emp.getId(),
                emp.getId() != null ? emp.getId() : "",
                emp.getFirstName() + " " + emp.getLastName(),
                emp.getDepartment() != null ? emp.getDepartment() : EMPTY,
                emp.getPosition() != null ? emp.getPosition() : EMPTY,
                campusOf(emp),
                blankToDash(emp.getCampusCode()),
                log.getDate(),
                formatTime(log.getTimeIn()),
                formatTime(log.getTimeOut()),
                hrs,
                EMPTY,
                statusLabel,
                "REGULAR",
                "HR",
                EMPTY,
                null,
                log.getId(),
                0L
            ));
        }

        for (EacOvertimeRequest r : eacOvertimeRequestRepository.findByWorkDateBetweenOrderByWorkDateDescIdDesc(from, to)) {
            Optional<OfficialEmployee> op = officialEmployeeRepository.findById(r.getEmployeeId());
            if (op.isEmpty()) {
                continue;
            }
            OfficialEmployee emp = op.get();
            int h = r.getOvertimeHours() != null ? r.getOvertimeHours() : 0;
            rows.add(new OvertimeDisplayRow(
                "EAC-" + r.getId(),
                "EAC request",
                emp.getId(),
                emp.getId() != null ? emp.getId() : "",
                emp.getFirstName() + " " + emp.getLastName(),
                emp.getDepartment() != null ? emp.getDepartment() : EMPTY,
                emp.getPosition() != null ? emp.getPosition() : EMPTY,
                campusOf(emp),
                blankToDash(emp.getCampusCode()),
                r.getWorkDate(),
                formatTime(r.getStartTime()),
                formatTime(r.getEndTime()),
                formatOtHoursLabel(h, 0),
                r.getOffsetDate() != null ? r.getOffsetDate().toString() : EMPTY,
                r.getStatus(),
                r.getOtType() != null ? r.getOtType() : "REGULAR",
                "HR",
                r.getLastActionBy() != null ? r.getLastActionBy() : EMPTY,
                attachmentUrl(r.getAttachmentPath()),
                0L,
                r.getId()
            ));
        }

        rows.sort(Comparator.comparing(OvertimeDisplayRow::workDate).reversed()
            .thenComparing(OvertimeDisplayRow::eacId));
        return rows;
    }

    public List<OvertimeDisplayRow> buildEmployeeList(String employeeId, LocalDate from, LocalDate to) {
        List<OvertimeDisplayRow> all = buildAdminList(from, to);
        return all.stream().filter(r -> employeeId != null && employeeId.equals(r.employeeId())).toList();
    }

    private static final String EMPTY = "-";
    private static final DateTimeFormatter TIME_FMT = DateTimeFormatter.ofPattern("HH:mm");

    private static String blankToDash(String c) {
        return c != null && !c.isBlank() ? c.trim() : EMPTY;
    }

    private static String campusOf(OfficialEmployee emp) {
        String c = emp.getCampusCode();
        return c != null && !c.isBlank() ? "Campus " + c : EMPTY;
    }

    private static String formatTime(LocalTime time) {
        return time != null ? time.format(TIME_FMT) : EMPTY;
    }

    private static String formatOtHoursLabel(int reported, int approved) {
        if (reported > 0 && approved > 0 && reported != approved) {
            return reported + " hr reported, " + approved + " hr approved";
        }
        if (reported > 0) {
            return reported + (reported == 1 ? " hr reported" : " hrs reported");
        }
        if (approved > 0) {
            return approved + (approved == 1 ? " hr approved" : " hrs approved");
        }
        return "0 hr";
    }

    private static String attachmentUrl(String path) {
        if (path == null || path.isBlank()) {
            return null;
        }
        String p = path.trim();
        return p.startsWith("/") ? p : "/" + p;
    }

    private Optional<OfficialEmployee> parseEmployee(String employeeIdStr) {
        if (employeeIdStr == null || employeeIdStr.isBlank()) {
            return Optional.empty();
        }
        return officialEmployeeRepository.findById(employeeIdStr.trim());
    }

    @Transactional
    public void submitEacRequest(
        String employeeId,
        LocalDate workDate,
        Integer overtimeHours,
        String otType,
        LocalDate offsetDate,
        String notes,
        String requestSource,
        MultipartFile attachment) throws IOException {

        if (workDate == null) {
            throw new IllegalArgumentException("Work date is required.");
        }
        int oh = overtimeHours != null ? Math.max(0, overtimeHours) : 0;
        if (oh <= 0) {
            throw new IllegalArgumentException("Overtime hours must be greater than zero.");
        }
        EacOvertimeRequest r = new EacOvertimeRequest();
        r.setEmployeeId(employeeId);
        r.setWorkDate(workDate);
        r.setOvertimeHours(oh);
        r.setOtType(otType != null && !otType.isBlank() ? otType.trim() : "REGULAR");
        r.setOffsetDate(offsetDate);
        r.setNotes(notes);
        r.setRequestSource(requestSource != null ? requestSource : "EMPLOYEE");
        r.setStatus("PENDING");
        r.setCreatedAt(LocalDateTime.now());
        if (attachment != null && !attachment.isEmpty()) {
            saveAttachment(r, attachment);
        }
        eacOvertimeRequestRepository.save(r);
    }

    private void saveAttachment(EacOvertimeRequest r, MultipartFile file) throws IOException {
        String orig = file.getOriginalFilename() != null ? file.getOriginalFilename() : "file";
        String ext = orig.contains(".") ? orig.substring(orig.lastIndexOf('.')) : "";
        if (ext.length() > 8) {
            ext = "";
        }
        String name = UUID.randomUUID() + ext;
        Path dir = Path.of(overtimeUploadDir).toAbsolutePath().normalize();
        Files.createDirectories(dir);
        Path target = dir.resolve(name);
        Files.copy(file.getInputStream(), target, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        r.setAttachmentPath("/uploads/overtime-attachments/" + name);
    }

    @Transactional
    public void approveEacRequest(long id, String approverLabel) {
        EacOvertimeRequest r = eacOvertimeRequestRepository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Request not found."));
        if (!"PENDING".equalsIgnoreCase(r.getStatus())) {
            throw new IllegalStateException("Only pending requests can be approved.");
        }
        r.setStatus("APPROVED");
        r.setLastActionBy(approverLabel);
        r.setDecidedAt(LocalDateTime.now());
        eacOvertimeRequestRepository.save(r);
    }

    @Transactional
    public void rejectEacRequest(long id, String approverLabel) {
        EacOvertimeRequest r = eacOvertimeRequestRepository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Request not found."));
        if (!"PENDING".equalsIgnoreCase(r.getStatus())) {
            throw new IllegalStateException("Only pending requests can be rejected.");
        }
        r.setStatus("REJECTED");
        r.setLastActionBy(approverLabel);
        r.setDecidedAt(LocalDateTime.now());
        eacOvertimeRequestRepository.save(r);
    }
}
