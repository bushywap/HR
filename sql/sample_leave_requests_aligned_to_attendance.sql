-- Leave applications aligned with TCMS attendance sample (Mar-May 2026).
-- Pairs with: sample-data/tcms_attendance_4_payroll_cycles.csv
--
-- Workflow: HR approves leave in leave_requests -> TCMS export shows VL/SL on those dates
-- (or re-import CSV / run attendance sync section below).
--
-- Run: mysql -u root -p eac_hr_db < sql/sample_leave_requests_aligned_to_attendance.sql

USE eac_hr_db;

-- ---------------------------------------------------------------------------
-- 1) Leave applications (EAC employee ids; skip if same period already exists)
-- ---------------------------------------------------------------------------

INSERT INTO leave_requests
  (employee_id, leave_type, start_date, end_date, total_days, status, reason,
   next_approver, last_action_by, decided_at, created_date)
SELECT v.employee_id, v.leave_type, v.start_date, v.end_date, v.total_days, v.status, v.reason,
       v.next_approver, v.last_action_by, v.decided_at, v.created_date
FROM (
  SELECT '1-00001' AS employee_id, 'Sick Leave' AS leave_type,
         DATE('2026-03-24') AS start_date, DATE('2026-03-24') AS end_date,
         1 AS total_days, 'APPROVED' AS status,
         'Flu - medical certificate on file' AS reason,
         'HR' AS next_approver, 'HR Admin' AS last_action_by,
         TIMESTAMP('2026-03-20 10:00:00') AS decided_at, DATE('2026-03-18') AS created_date
  UNION ALL
  SELECT '1-00002', 'Vacation Leave', DATE('2026-04-14'), DATE('2026-04-15'), 2, 'APPROVED',
         'Family event - approved VL', 'HR', 'HR Admin', TIMESTAMP('2026-04-10 14:30:00'), DATE('2026-04-08')
  UNION ALL
  SELECT '1-00003', 'Sick Leave', DATE('2026-04-08'), DATE('2026-04-08'), 1, 'APPROVED',
         'Unwell - SL with clinic note', 'HR', 'HR Admin', TIMESTAMP('2026-04-07 09:00:00'), DATE('2026-04-07')
  UNION ALL
  SELECT '1-00001', 'Vacation Leave', DATE('2026-04-28'), DATE('2026-04-29'), 2, 'REJECTED',
         'Peak enrollment week - insufficient staffing', 'HR', 'HR Admin', TIMESTAMP('2026-04-22 11:00:00'), DATE('2026-04-20')
  UNION ALL
  SELECT '1-00003', 'Service Incentive Leave', DATE('2026-05-06'), DATE('2026-05-07'), 2, 'APPROVED',
         'SIL - 10-year service milestone', 'HR', 'HR Admin', TIMESTAMP('2026-05-02 08:45:00'), DATE('2026-05-01')
  UNION ALL
  SELECT '1-00001', 'Vacation Leave', DATE('2026-05-01'), DATE('2026-05-02'), 2, 'APPROVED',
         'Long weekend VL', 'HR', 'HR Admin', TIMESTAMP('2026-04-28 16:00:00'), DATE('2026-04-25')
  UNION ALL
  SELECT '1-00002', 'Vacation Leave', DATE('2026-05-22'), DATE('2026-05-23'), 2, 'PENDING',
         'Personal travel - awaiting HR', 'HR', NULL, NULL, DATE('2026-05-15')
  UNION ALL
  SELECT '1-00003', 'Sick Leave', DATE('2026-05-20'), DATE('2026-05-20'), 1, 'PENDING',
         'Follow-up checkup', 'HR', NULL, NULL, DATE('2026-05-16')
) AS v
WHERE EXISTS (SELECT 1 FROM employee e WHERE e.employee_id = v.employee_id)
  AND NOT EXISTS (
    SELECT 1 FROM leave_requests lr
    WHERE lr.employee_id = v.employee_id
      AND lr.start_date = v.start_date
      AND lr.end_date = v.end_date
      AND lr.leave_type = v.leave_type
  );

-- ---------------------------------------------------------------------------
-- 2) Attendance rows: set tcms_leave_type to match APPROVED leaves (re-import optional)
--    employee_id in attendance = EAC id (1-00001, ...)
-- ---------------------------------------------------------------------------

UPDATE attendance
SET tcms_leave_type = 'SL',
    time_in = COALESCE(time_in, '08:00:00'),
    time_out = COALESCE(time_out, '17:00:00'),
    total_hours = COALESCE(NULLIF(total_hours, 0), 8),
    day_type = COALESCE(NULLIF(TRIM(day_type), ''), 'Workday')
WHERE employee_id = '1-00001' AND date = '2026-03-24';

UPDATE attendance
SET tcms_leave_type = 'VL',
    time_in = COALESCE(time_in, '08:00:00'),
    time_out = COALESCE(time_out, '17:00:00'),
    total_hours = COALESCE(NULLIF(total_hours, 0), 8),
    day_type = COALESCE(NULLIF(TRIM(day_type), ''), 'Workday')
WHERE employee_id = '1-00002' AND date IN ('2026-04-14', '2026-04-15');

UPDATE attendance
SET tcms_leave_type = 'SL',
    time_in = COALESCE(time_in, '08:00:00'),
    time_out = COALESCE(time_out, '17:00:00'),
    total_hours = COALESCE(NULLIF(total_hours, 0), 8),
    day_type = COALESCE(NULLIF(TRIM(day_type), ''), 'Workday')
WHERE employee_id = '1-00003' AND date = '2026-04-08';

UPDATE attendance
SET tcms_leave_type = 'SIL',
    time_in = COALESCE(time_in, '08:00:00'),
    time_out = COALESCE(time_out, '17:00:00'),
    total_hours = COALESCE(NULLIF(total_hours, 0), 8),
    day_type = COALESCE(NULLIF(TRIM(day_type), ''), 'Workday')
WHERE employee_id = '1-00003' AND date IN ('2026-05-06', '2026-05-07');

UPDATE attendance
SET tcms_leave_type = 'VL',
    time_in = COALESCE(time_in, '08:00:00'),
    time_out = COALESCE(time_out, '17:00:00'),
    total_hours = COALESCE(NULLIF(total_hours, 0), 8),
    day_type = COALESCE(NULLIF(TRIM(day_type), ''), 'Workday')
WHERE employee_id = '1-00001' AND date IN ('2026-05-01', '2026-05-02');

-- Rejected leave: ensure attendance does NOT show VL on those days
UPDATE attendance
SET tcms_leave_type = NULL
WHERE employee_id = '1-00001' AND date IN ('2026-04-28', '2026-04-29');

SELECT employee_id, leave_type, start_date, end_date, status
FROM leave_requests
WHERE employee_id IN ('1-00001', '1-00002', '1-00003')
ORDER BY start_date, employee_id;

SELECT employee_id, date, tcms_leave_type, time_in, time_out
FROM attendance
WHERE employee_id IN ('1-00001', '1-00002', '1-00003')
  AND (tcms_leave_type IS NOT NULL AND TRIM(tcms_leave_type) <> '')
ORDER BY date, employee_id;
