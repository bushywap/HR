package com.example.employee.model;

import java.time.LocalDate;

/**
 * One row in HR "Pending overtime" screen (per attendance record).
 */
public class OvertimeApprovalListItem {

    private long attendanceId;
    private String employeeId;
    private String employeeName;
    private LocalDate workDate;
    private int reportedOtHours;
    private String biometricsStatus;

    public OvertimeApprovalListItem() {}

    public OvertimeApprovalListItem(long attendanceId, String employeeId, String employeeName,
                                    LocalDate workDate, int reportedOtHours, String biometricsStatus) {
        this.attendanceId = attendanceId;
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.workDate = workDate;
        this.reportedOtHours = reportedOtHours;
        this.biometricsStatus = biometricsStatus;
    }

    public long getAttendanceId() { return attendanceId; }
    public void setAttendanceId(long attendanceId) { this.attendanceId = attendanceId; }
    public String getEmployeeId() { return employeeId; }
    public void setEmployeeId(String employeeId) { this.employeeId = employeeId; }
    public String getEmployeeName() { return employeeName; }
    public void setEmployeeName(String employeeName) { this.employeeName = employeeName; }
    public LocalDate getWorkDate() { return workDate; }
    public void setWorkDate(LocalDate workDate) { this.workDate = workDate; }
    public int getReportedOtHours() { return reportedOtHours; }
    public void setReportedOtHours(int reportedOtHours) { this.reportedOtHours = reportedOtHours; }
    public String getBiometricsStatus() { return biometricsStatus; }
    public void setBiometricsStatus(String biometricsStatus) { this.biometricsStatus = biometricsStatus; }
}
