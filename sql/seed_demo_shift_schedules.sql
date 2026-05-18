-- Shift templates for demo (align with expected_shift on employee + TCMS import).
-- Run after: sql/seed_demo_school_employees.sql

USE eac_hr_db;

INSERT INTO shift_schedule (
  name, branch_code, start_time, end_time, grace_minutes, break_minutes,
  is_flexible_hours, required_net_work_minutes, allow_extra_hours, require_ot_approval,
  missing_punch_policy, minimum_minutes_for_ot, is_active, created_by, updated_by, created_at, updated_at, notes
)
SELECT 'Admin Day (08:00-17:00)', '1', '08:00:00', '17:00:00', 15, 60,
       0, 480, 1, 1, 'AUTO_CLOSE', 60, 1, 'seed', 'seed', NOW(), NOW(),
       'Full-time staff default'
WHERE NOT EXISTS (SELECT 1 FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND branch_code = '1');

INSERT INTO shift_schedule (
  name, branch_code, start_time, end_time, grace_minutes, break_minutes,
  is_flexible_hours, flexi_in_window_start, flexi_in_window_end,
  required_net_work_minutes, allow_extra_hours, require_ot_approval,
  missing_punch_policy, minimum_minutes_for_ot, is_active, created_by, updated_by, created_at, updated_at, notes
)
SELECT 'Flex Admin (09:00-18:00)', '1', '09:00:00', '18:00:00', 15, 60,
       1, '09:00:00', '10:00:00', 480, 1, 1, 'AUTO_CLOSE', 60, 1, 'seed', 'seed', NOW(), NOW(),
       'HR flexi window'
WHERE NOT EXISTS (SELECT 1 FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND branch_code = '1');

INSERT INTO shift_schedule (
  name, branch_code, start_time, end_time, grace_minutes, break_minutes,
  is_flexible_hours, required_net_work_minutes, allow_extra_hours, require_ot_approval,
  missing_punch_policy, minimum_minutes_for_ot, is_active, created_by, updated_by, created_at, updated_at, notes
)
SELECT 'Dean (08:30-17:30)', '1', '08:30:00', '17:30:00', 15, 60,
       0, 510, 1, 1, 'AUTO_CLOSE', 60, 1, 'seed', 'seed', NOW(), NOW(),
       'Dean schedule'
WHERE NOT EXISTS (SELECT 1 FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND branch_code = '1');

INSERT INTO shift_schedule (
  name, branch_code, start_time, end_time, grace_minutes, break_minutes,
  is_flexible_hours, required_net_work_minutes, allow_extra_hours, require_ot_approval,
  missing_punch_policy, minimum_minutes_for_ot, is_active, created_by, updated_by, created_at, updated_at, notes
)
SELECT 'Part-Time PM (13:00-17:00)', '1', '13:00:00', '17:00:00', 10, 0,
       0, 240, 0, 1, 'REVIEW_REQUIRED', 60, 1, 'seed', 'seed', NOW(), NOW(),
       'Part-time MWF maintenance'
WHERE NOT EXISTS (SELECT 1 FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND branch_code = '1');

INSERT INTO shift_schedule (
  name, branch_code, start_time, end_time, grace_minutes, break_minutes,
  is_flexible_hours, required_net_work_minutes, allow_extra_hours, require_ot_approval,
  missing_punch_policy, minimum_minutes_for_ot, is_active, created_by, updated_by, created_at, updated_at, notes
)
SELECT 'Part-Time MWF (13:00-17:00)', '1', '13:00:00', '17:00:00', 10, 0,
       0, 240, 0, 1, 'REVIEW_REQUIRED', 60, 1, 'seed', 'seed', NOW(), NOW(),
       'Part-time faculty MWF'
WHERE NOT EXISTS (SELECT 1 FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND branch_code = '1');

INSERT INTO shift_schedule (
  name, branch_code, start_time, end_time, grace_minutes, break_minutes,
  is_flexible_hours, required_net_work_minutes, allow_extra_hours, require_ot_approval,
  missing_punch_policy, minimum_minutes_for_ot, is_active, created_by, updated_by, created_at, updated_at, notes
)
SELECT 'Part-Time Tue-Thu (13:00-17:00)', '1', '13:00:00', '17:00:00', 10, 0,
       0, 240, 0, 1, 'REVIEW_REQUIRED', 60, 1, 'seed', 'seed', NOW(), NOW(),
       'Part-time faculty Tue/Thu'
WHERE NOT EXISTS (SELECT 1 FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND branch_code = '1');

INSERT INTO shift_schedule (
  name, branch_code, start_time, end_time, grace_minutes, break_minutes,
  is_flexible_hours, required_net_work_minutes, allow_extra_hours, require_ot_approval,
  missing_punch_policy, minimum_minutes_for_ot, is_active, created_by, updated_by, created_at, updated_at, notes
)
SELECT 'Cashier Window (08:00-17:00)', '1', '08:00:00', '17:00:00', 10, 60,
       0, 480, 0, 1, 'AUTO_CLOSE', 60, 1, 'seed', 'seed', NOW(), NOW(),
       'Cashier'
WHERE NOT EXISTS (SELECT 1 FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND branch_code = '1');

SELECT id, name, TIME_FORMAT(start_time, '%H:%i') AS start_t, TIME_FORMAT(end_time, '%H:%i') AS end_t
FROM shift_schedule WHERE is_active = 1 ORDER BY name;
