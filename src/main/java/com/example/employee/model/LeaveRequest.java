package com.example.employee.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "leave_requests")
public class LeaveRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "employee_id", length = 20)
    private String employeeId;
    private String leaveType;
    private LocalDate startDate;
    private LocalDate endDate;
    private String status = "PENDING";

    @Column(name = "reason", length = 2000)
    private String reason;

    @Column(name = "next_approver", length = 120)
    private String nextApprover = "HR";

    @Column(name = "last_action_by", length = 120)
    private String lastActionBy;

    @Column(name = "decided_at")
    private LocalDateTime decidedAt;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getEmployeeId() { return employeeId; }
    public void setEmployeeId(String employeeId) { this.employeeId = employeeId; }
    public String getLeaveType() { return leaveType; }
    public void setLeaveType(String leaveType) { this.leaveType = leaveType; }
    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }
    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    public String getNextApprover() { return nextApprover; }
    public void setNextApprover(String nextApprover) { this.nextApprover = nextApprover; }
    public String getLastActionBy() { return lastActionBy; }
    public void setLastActionBy(String lastActionBy) { this.lastActionBy = lastActionBy; }
    public LocalDateTime getDecidedAt() { return decidedAt; }
    public void setDecidedAt(LocalDateTime decidedAt) { this.decidedAt = decidedAt; }
}