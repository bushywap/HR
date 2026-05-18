-- OB, leave, and standalone OT requests for all 10 demo employees.
-- Pairs with sample-data/tcms_attendance_4_payroll_cycles.csv (regenerate after edits).
--
-- Run: Get-Content -Raw sql\seed_demo_ob_leave_ot_expanded.sql | & "C:\Program Files\MySQL\MySQL Server 9.7\bin\mysql.exe" -u root -p eac_hr_db

USE eac_hr_db;

-- ---------------------------------------------------------------------------
-- Official Business
-- ---------------------------------------------------------------------------
INSERT INTO eac_official_business_request
  (employee_id, business_date, start_time, end_time, ob_hours, purpose, status,
   next_approver, last_action_by, request_source, notes, created_at, decided_at)
SELECT v.employee_id, v.business_date, v.start_time, v.end_time, v.ob_hours, v.purpose, v.status,
       'HR', v.last_action_by, 'MANUAL', v.notes, NOW(), v.decided_at
FROM (
  SELECT '1-00001' AS employee_id, DATE('2026-05-05') AS business_date,
         TIME('09:00:00') AS start_time, TIME('12:00:00') AS end_time, 3 AS ob_hours,
         'Registrar records verification' AS purpose, 'PENDING' AS status,
         NULL AS last_action_by, NULL AS decided_at, 'Sample OB pending' AS notes
  UNION ALL SELECT '1-00002', DATE('2026-05-08'), TIME('13:00:00'), TIME('17:00:00'), 4,
         'Industry partner meeting - Cavite', 'PENDING', NULL, NULL, 'Sample OB pending'
  UNION ALL SELECT '1-00003', DATE('2026-05-12'), TIME('08:00:00'), TIME('17:00:00'), 8,
         'BIR document submission', 'APPROVED', 'HR Admin', NOW(), 'Approved OB full day'
  UNION ALL SELECT '1-00001', DATE('2026-05-15'), TIME('10:00:00'), TIME('14:00:00'), 4,
         'Accreditation site visit', 'REJECTED', 'HR Admin', NOW(), 'Rejected OB'
  UNION ALL SELECT '1-00004', DATE('2026-04-16'), TIME('08:30:00'), TIME('12:30:00'), 4,
         'CHED regional planning session', 'APPROVED', 'HR Admin', NOW(), 'Dean OB'
  UNION ALL SELECT '1-00005', DATE('2026-03-03'), TIME('13:00:00'), TIME('17:00:00'), 4,
         'SET industry advisory board', 'APPROVED', 'HR Admin', NOW(), 'Faculty OB'
  UNION ALL SELECT '1-00007', DATE('2026-02-10'), TIME('09:00:00'), TIME('12:00:00'), 3,
         'TOR authentication - CHED', 'APPROVED', 'HR Admin', NOW(), 'Registrar OB'
  UNION ALL SELECT '1-00008', DATE('2026-04-02'), TIME('09:00:00'), TIME('15:00:00'), 6,
         'Job fair recruitment - off campus', 'APPROVED', 'HR Admin', NOW(), 'HR OB'
  UNION ALL SELECT '1-00009', DATE('2026-05-07'), TIME('13:00:00'), TIME('17:00:00'), 4,
         'PT clinical site coordination', 'PENDING', NULL, NULL, 'Lecturer OB'
  UNION ALL SELECT '1-00010', DATE('2026-05-11'), TIME('08:00:00'), TIME('12:00:00'), 4,
         'Bank reconciliation - main branch', 'PENDING', NULL, NULL, 'Cashier OB morning'
) AS v
WHERE EXISTS (SELECT 1 FROM employee e WHERE e.employee_id = v.employee_id)
  AND NOT EXISTS (
    SELECT 1 FROM eac_official_business_request o
    WHERE o.employee_id = v.employee_id AND o.business_date = v.business_date
      AND o.start_time = v.start_time
  );

-- ---------------------------------------------------------------------------
-- Leave (additional rows for new hires; skips duplicates)
-- ---------------------------------------------------------------------------
INSERT INTO leave_requests
  (employee_id, leave_type, start_date, end_date, total_days, status, reason,
   next_approver, last_action_by, decided_at, created_date)
SELECT v.employee_id, v.leave_type, v.start_date, v.end_date, v.total_days, v.status, v.reason,
       'HR', v.last_action_by, v.decided_at, v.created_date
FROM (
  SELECT '1-00007' AS employee_id, 'Vacation Leave' AS leave_type,
         DATE('2026-03-17') AS start_date, DATE('2026-03-18') AS end_date,
         2 AS total_days, 'APPROVED' AS status, 'Registrar filing break' AS reason,
         'HR Admin' AS last_action_by, TIMESTAMP('2026-03-14 11:00:00') AS decided_at,
         DATE('2026-03-12') AS created_date
  UNION ALL SELECT '1-00008', 'Sick Leave', DATE('2026-04-21'), DATE('2026-04-21'), 1, 'APPROVED',
         'Medical certificate submitted', 'HR Admin', TIMESTAMP('2026-04-20 08:00:00'), DATE('2026-04-20')
  UNION ALL SELECT '1-00009', 'Vacation Leave', DATE('2026-05-01'), DATE('2026-05-01'), 1, 'APPROVED',
         'Labor day long weekend', 'HR Admin', TIMESTAMP('2026-04-25 10:00:00'), DATE('2026-04-22')
  UNION ALL SELECT '1-00010', 'Sick Leave', DATE('2026-02-03'), DATE('2026-02-03'), 1, 'APPROVED',
         'Flu', 'HR Admin', TIMESTAMP('2026-02-02 09:00:00'), DATE('2026-02-02')
  UNION ALL SELECT '1-00004', 'Vacation Leave', DATE('2026-01-02'), DATE('2026-01-02'), 1, 'APPROVED',
         'New year admin closure', 'HR Admin', TIMESTAMP('2025-12-28 14:00:00'), DATE('2025-12-20')
  UNION ALL SELECT '1-00008', 'Vacation Leave', DATE('2026-05-25'), DATE('2026-05-26'), 2, 'PENDING',
         'Family event', NULL, NULL, DATE('2026-05-17')
  UNION ALL SELECT '1-00007', 'Sick Leave', DATE('2026-05-19'), DATE('2026-05-19'), 1, 'PENDING',
         'Follow-up appointment', NULL, NULL, DATE('2026-05-16')
) AS v
WHERE EXISTS (SELECT 1 FROM employee e WHERE e.employee_id = v.employee_id)
  AND NOT EXISTS (
    SELECT 1 FROM leave_requests lr
    WHERE lr.employee_id = v.employee_id AND lr.start_date = v.start_date
      AND lr.end_date = v.end_date AND lr.leave_type = v.leave_type
  );

-- ---------------------------------------------------------------------------
-- Standalone OT requests (EAC form workflow; TCMS OT still in attendance CSV)
-- ---------------------------------------------------------------------------
INSERT INTO eac_overtime_request
  (employee_id, work_date, start_time, end_time, overtime_hours, ot_type, status,
   request_source, last_action_by, notes, created_at, decided_at)
SELECT v.employee_id, v.work_date, v.start_time, v.end_time, v.overtime_hours, 'REGULAR', v.status,
       'EMPLOYEE', v.last_action_by, v.notes, NOW(), v.decided_at
FROM (
  SELECT '1-00001' AS employee_id, DATE('2026-03-10') AS work_date,
         TIME('17:00:00') AS start_time, TIME('18:30:00') AS end_time, 2 AS overtime_hours,
         'APPROVED' AS status, 'HR Admin' AS last_action_by, NOW() AS decided_at,
         'Enrollment encoding OT' AS notes
  UNION ALL SELECT '1-00002', DATE('2026-02-18'), TIME('17:00:00'), TIME('19:00:00'), 2, 'APPROVED',
         'HR Admin', NOW(), 'Skills lab prep'
  UNION ALL SELECT '1-00005', DATE('2026-03-19'), TIME('17:00:00'), TIME('18:30:00'), 2, 'APPROVED',
         'HR Admin', NOW(), 'Capstone panel'
  UNION ALL SELECT '1-00005', DATE('2026-05-14'), TIME('17:00:00'), TIME('19:00:00'), 2, 'PENDING',
         NULL, NULL, 'End of semester encoding'
  UNION ALL SELECT '1-00007', DATE('2026-01-15'), TIME('17:00:00'), TIME('18:00:00'), 1, 'APPROVED',
         'HR Admin', NOW(), 'TOR rush week'
  UNION ALL SELECT '1-00004', DATE('2026-02-05'), TIME('17:30:00'), TIME('19:00:00'), 2, 'APPROVED',
         'HR Admin', NOW(), 'Board report deadline'
  UNION ALL SELECT '1-00010', DATE('2026-04-03'), TIME('17:00:00'), TIME('18:30:00'), 2, 'APPROVED',
         'HR Admin', NOW(), 'Tuition deadline week'
  UNION ALL SELECT '1-00008', DATE('2026-03-25'), TIME('18:00:00'), TIME('20:00:00'), 2, 'PENDING',
         NULL, NULL, 'Recruitment event follow-up'
) AS v
WHERE EXISTS (SELECT 1 FROM employee e WHERE e.employee_id = v.employee_id)
  AND NOT EXISTS (
    SELECT 1 FROM eac_overtime_request o
    WHERE o.employee_id = v.employee_id AND o.work_date = v.work_date
      AND o.overtime_hours = v.overtime_hours
  );

SELECT 'OB' AS kind, status, COUNT(*) AS cnt FROM eac_official_business_request GROUP BY status;
SELECT 'Leave' AS kind, status, COUNT(*) AS cnt FROM leave_requests GROUP BY status;
SELECT 'OT req' AS kind, status, COUNT(*) AS cnt FROM eac_overtime_request GROUP BY status;
