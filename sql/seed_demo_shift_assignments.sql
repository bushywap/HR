-- Auto-generated: sample-data/build_demo_shift_assignments_sql.py
-- Assigns one shift per employee per workday (Jan-May 2026). Required for TCMS late/OT rules.
-- Run: Get-Content -Raw sql\seed_demo_shift_assignments.sql | & mysql.exe -u root -p eac_hr_db

USE eac_hr_db;

DELETE FROM shift_assignment WHERE source = 'seed';

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-01') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-01') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-01') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-01') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-01') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-01') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-01') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-01') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-02') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-02') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-02') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-02') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-02') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-02') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-02') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-02') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-02') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-05') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-05') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-05') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-05') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-05') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-05') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-05') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-05') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-05') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-06') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-06') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-06') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-06') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-06') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-06') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-06') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-06') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-07') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-07') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-07') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-07') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-07') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-07') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-07') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-07') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-07') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-08') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-08') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-08') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-08') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-08') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-08') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-08') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-08') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-09') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-09') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-09') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-09') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-09') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-09') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-09') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-09') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-09') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-12') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-12') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-12') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-12') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-12') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-12') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-12') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-12') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-12') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-13') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-13') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-13') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-13') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-13') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-13') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-13') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-13') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-14') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-14') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-14') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-14') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-14') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-14') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-14') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-14') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-14') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-15') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-15') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-15') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-15') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-15') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-15') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-15') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-15') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-16') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-16') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-16') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-16') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-16') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-16') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-16') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-16') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-16') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-19') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-19') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-19') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-19') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-19') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-19') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-19') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-19') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-19') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-20') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-20') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-20') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-20') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-20') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-20') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-20') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-20') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-21') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-21') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-21') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-21') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-21') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-21') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-21') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-21') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-21') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-22') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-22') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-22') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-22') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-22') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-22') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-22') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-22') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-23') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-23') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-23') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-23') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-23') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-23') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-23') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-23') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-23') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-26') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-26') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-26') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-26') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-26') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-26') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-26') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-26') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-26') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-27') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-27') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-27') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-27') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-27') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-27') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-27') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-27') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-28') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-28') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-28') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-28') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-28') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-28') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-28') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-28') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-28') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-29') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-29') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-29') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-29') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-29') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-29') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-29') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-29') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-30') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-30') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-30') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-30') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-30') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-30') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-30') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-30') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-01-30') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-02') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-02') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-02') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-02') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-02') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-02') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-02') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-02') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-02') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-03') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-03') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-03') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-03') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-03') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-03') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-03') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-03') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-04') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-04') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-04') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-04') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-04') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-04') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-04') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-04') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-04') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-05') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-05') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-05') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-05') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-05') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-05') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-05') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-05') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-06') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-06') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-06') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-06') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-06') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-06') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-06') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-06') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-06') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-09') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-09') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-09') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-09') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-09') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-09') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-09') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-09') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-09') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-10') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-10') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-10') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-10') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-10') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-10') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-10') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-10') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-11') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-11') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-11') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-11') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-11') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-11') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-11') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-11') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-11') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-12') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-12') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-12') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-12') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-12') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-12') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-12') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-12') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-13') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-13') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-13') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-13') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-13') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-13') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-13') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-13') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-13') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-16') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-16') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-16') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-16') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-16') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-16') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-16') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-16') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-16') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-17') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-17') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-17') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-17') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-17') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-17') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-17') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-17') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-18') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-18') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-18') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-18') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-18') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-18') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-18') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-18') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-18') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-19') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-19') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-19') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-19') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-19') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-19') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-19') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-19') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-20') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-20') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-20') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-20') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-20') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-20') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-20') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-20') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-20') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-23') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-23') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-23') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-23') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-23') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-23') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-23') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-23') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-23') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-24') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-24') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-24') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-24') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-24') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-24') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-24') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-24') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-25') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-25') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-25') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-25') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-25') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-25') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-25') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-25') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-25') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-26') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-26') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-26') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-26') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-26') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-26') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-26') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-26') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-27') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-27') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-27') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-27') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-27') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-27') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-27') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-27') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-02-27') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-02') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-02') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-02') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-02') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-02') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-02') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-02') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-02') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-02') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-03') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-03') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-03') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-03') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-03') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-03') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-03') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-03') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-04') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-04') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-04') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-04') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-04') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-04') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-04') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-04') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-04') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-05') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-05') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-05') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-05') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-05') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-05') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-05') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-05') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-06') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-06') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-06') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-06') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-06') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-06') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-06') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-06') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-06') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-09') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-09') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-09') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-09') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-09') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-09') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-09') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-09') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-09') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-10') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-10') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-10') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-10') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-10') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-10') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-10') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-10') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-11') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-11') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-11') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-11') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-11') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-11') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-11') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-11') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-11') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-12') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-12') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-12') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-12') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-12') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-12') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-12') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-12') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-13') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-13') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-13') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-13') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-13') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-13') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-13') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-13') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-13') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-16') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-16') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-16') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-16') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-16') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-16') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-16') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-16') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-16') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-17') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-17') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-17') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-17') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-17') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-17') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-17') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-17') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-18') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-18') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-18') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-18') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-18') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-18') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-18') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-18') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-18') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-19') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-19') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-19') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-19') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-19') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-19') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-19') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-19') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-20') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-20') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-20') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-20') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-20') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-20') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-20') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-20') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-20') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-23') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-23') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-23') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-23') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-23') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-23') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-23') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-23') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-23') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-24') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-24') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-24') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-24') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-24') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-24') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-24') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-24') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-25') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-25') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-25') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-25') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-25') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-25') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-25') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-25') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-25') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-26') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-26') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-26') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-26') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-26') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-26') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-26') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-26') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-27') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-27') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-27') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-27') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-27') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-27') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-27') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-27') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-27') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-30') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-30') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-30') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-30') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-30') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-30') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-30') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-30') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-30') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-31') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-31') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-31') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-31') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-31') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-31') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-31') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-03-31') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-01') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-01') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-01') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-01') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-01') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-01') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-01') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-01') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-01') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-02') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-02') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-02') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-02') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-02') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-02') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-02') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-02') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-03') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-03') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-03') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-03') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-03') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-03') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-03') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-03') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-03') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-06') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-06') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-06') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-06') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-06') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-06') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-06') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-06') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-06') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-07') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-07') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-07') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-07') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-07') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-07') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-07') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-07') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-08') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-08') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-08') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-08') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-08') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-08') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-08') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-08') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-08') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-09') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-09') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-09') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-09') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-09') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-09') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-09') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-09') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-10') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-10') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-10') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-10') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-10') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-10') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-10') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-10') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-10') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-13') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-13') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-13') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-13') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-13') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-13') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-13') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-13') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-13') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-14') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-14') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-14') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-14') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-14') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-14') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-14') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-14') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-15') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-15') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-15') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-15') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-15') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-15') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-15') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-15') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-15') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-16') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-16') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-16') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-16') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-16') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-16') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-16') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-16') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-17') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-17') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-17') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-17') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-17') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-17') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-17') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-17') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-17') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-20') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-20') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-20') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-20') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-20') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-20') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-20') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-20') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-20') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-21') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-21') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-21') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-21') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-21') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-21') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-21') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-21') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-22') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-22') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-22') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-22') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-22') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-22') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-22') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-22') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-22') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-23') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-23') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-23') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-23') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-23') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-23') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-23') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-23') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-24') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-24') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-24') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-24') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-24') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-24') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-24') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-24') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-24') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-27') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-27') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-27') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-27') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-27') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-27') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-27') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-27') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-27') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-28') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-28') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-28') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-28') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-28') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-28') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-28') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-28') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-29') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-29') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-29') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-29') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-29') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-29') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-29') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-29') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-29') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-30') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-30') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-30') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-30') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-30') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-30') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-30') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-04-30') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-01') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-01') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-01') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-01') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-01') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-01') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-01') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-01') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-01') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-04') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-04') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-04') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-04') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-04') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-04') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-04') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-04') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-04') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-05') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-05') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-05') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-05') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-05') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-05') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-05') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-05') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-06') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-06') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-06') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-06') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-06') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-06') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-06') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-06') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-06') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-07') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-07') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-07') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-07') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-07') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-07') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-07') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-07') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-08') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-08') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-08') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-08') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-08') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-08') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-08') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-08') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-08') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-11') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-11') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-11') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-11') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-11') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-11') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-11') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-11') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-11') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

INSERT INTO shift_assignment (employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)
SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()
FROM (
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-12') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-12') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-12') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-12') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-12') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-12') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-12') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-12') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-13') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-13') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-13') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-13') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-13') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-13') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-13') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-13') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-13') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-14') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-14') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-14') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-14') AS work_date
UNION ALL
SELECT '1-00006' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time Tue-Thu (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-14') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-14') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-14') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-14') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-15') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-15') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-15') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-15') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-15') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-15') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-15') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-15') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-15') AS work_date
UNION ALL
SELECT '1-00001' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-18') AS work_date
UNION ALL
SELECT '1-00002' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-18') AS work_date
UNION ALL
SELECT '1-00003' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time PM (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-18') AS work_date
UNION ALL
SELECT '1-00004' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Dean (08:30-17:30)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-18') AS work_date
UNION ALL
SELECT '1-00005' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-18') AS work_date
UNION ALL
SELECT '1-00007' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Admin Day (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-18') AS work_date
UNION ALL
SELECT '1-00008' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Flex Admin (09:00-18:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-18') AS work_date
UNION ALL
SELECT '1-00009' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Part-Time MWF (13:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-18') AS work_date
UNION ALL
SELECT '1-00010' AS employee_id, (SELECT id FROM shift_schedule WHERE name = 'Cashier Window (08:00-17:00)' AND is_active = 1 LIMIT 1) AS shift_id, DATE('2026-05-18') AS work_date
) AS v
WHERE v.shift_id IS NOT NULL
ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();

SELECT employee_id, COUNT(*) AS assignment_days
FROM shift_assignment WHERE source = 'seed'
GROUP BY employee_id ORDER BY employee_id;
