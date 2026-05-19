-- Align attendance.employee_id with employee.employee_id (EAC format, e.g. 1-00001).
-- There is NO custom_employee_id column — the PK employee.employee_id is the official EAC id.
-- Run once if old attendance rows still use legacy keys like '1', '2', '3'.
-- Safe to re-run: only updates exact legacy values listed below.
--
-- PowerShell:
--   Get-Content -Raw "...\sql\align_attendance_to_eac_employee_id.sql" | & "C:\Program Files\MySQL\MySQL Server 9.7\bin\mysql.exe" -u root -p eac_hr_db

USE eac_hr_db;

-- Legacy numeric string ids -> demo EAC ids (extend if you had more legacy rows)
UPDATE attendance SET employee_id = '1-00001' WHERE employee_id IN ('1', 1);
UPDATE attendance SET employee_id = '1-00002' WHERE employee_id IN ('2', 2);
UPDATE attendance SET employee_id = '1-00003' WHERE employee_id IN ('3', 3);
UPDATE attendance SET employee_id = '1-00004' WHERE employee_id IN ('4', 4);
UPDATE attendance SET employee_id = '1-00005' WHERE employee_id IN ('5', 5);
UPDATE attendance SET employee_id = '1-00006' WHERE employee_id IN ('6', 6);
UPDATE attendance SET employee_id = '1-00007' WHERE employee_id IN ('7', 7);
UPDATE attendance SET employee_id = '1-00008' WHERE employee_id IN ('8', 8);
UPDATE attendance SET employee_id = '1-00009' WHERE employee_id IN ('9', 9);
UPDATE attendance SET employee_id = '1-00010' WHERE employee_id IN ('10', 10);

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
