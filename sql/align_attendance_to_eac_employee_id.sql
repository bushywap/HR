-- Align attendance.employee_id with employee.employee_id (EAC format, e.g. 1-00001).
-- There is NO custom_employee_id column — the PK employee.employee_id is the official EAC id.
-- Run once if old attendance rows still use legacy keys like '1', '2', '3'.
-- Safe to re-run: only updates exact legacy values listed below.
--
-- PowerShell:
--   Get-Content -Raw "...\sql\align_attendance_to_eac_employee_id.sql" | & "C:\Program Files\MySQL\MySQL Server 9.7\bin\mysql.exe" -u root -p eac_hr_db

USE eac_hr_db;

-- Workbench "safe update mode" (1175) requires a KEY in WHERE; id is the PK.
-- Alternatively: Edit -> Preferences -> SQL Editor -> uncheck "Safe Updates", reconnect.

SET SESSION SQL_SAFE_UPDATES = 0;

UPDATE attendance SET employee_id = '1-00001' WHERE employee_id IN ('1') AND id > 0;
UPDATE attendance SET employee_id = '1-00002' WHERE employee_id IN ('2') AND id > 0;
UPDATE attendance SET employee_id = '1-00003' WHERE employee_id IN ('3') AND id > 0;
UPDATE attendance SET employee_id = '1-00004' WHERE employee_id IN ('4') AND id > 0;
UPDATE attendance SET employee_id = '1-00005' WHERE employee_id IN ('5') AND id > 0;
UPDATE attendance SET employee_id = '1-00006' WHERE employee_id IN ('6') AND id > 0;
UPDATE attendance SET employee_id = '1-00007' WHERE employee_id IN ('7') AND id > 0;
UPDATE attendance SET employee_id = '1-00008' WHERE employee_id IN ('8') AND id > 0;
UPDATE attendance SET employee_id = '1-00009' WHERE employee_id IN ('9') AND id > 0;
UPDATE attendance SET employee_id = '1-00010' WHERE employee_id IN ('10') AND id > 0;

SET SESSION SQL_SAFE_UPDATES = 1;

-- Verify: attendance keys should match active employees
SELECT a.employee_id, COUNT(*) AS days
FROM attendance a
LEFT JOIN employee e ON e.employee_id = a.employee_id
GROUP BY a.employee_id
ORDER BY a.employee_id;

-- Rows with no matching employee (fix or delete before payroll)
SELECT a.employee_id, COUNT(*) AS orphan_days
FROM attendance a
LEFT JOIN employee e ON e.employee_id = a.employee_id
WHERE e.employee_id IS NULL
GROUP BY a.employee_id;
