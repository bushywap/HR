-- Link HR demo employees (1-00001..1-00010) to payroll designation rows so
-- payroll Attendance / faculty tabs include them (findTeaching / findEmployee).
-- Run after seed_demo_school_employees.sql and once designation table is populated.
--
-- PowerShell:
--   Get-Content -Raw "...\sql\align_demo_employees_for_payroll.sql" | & "C:\Program Files\MySQL\MySQL Server 9.7\bin\mysql.exe" -u root -p eac_hr_db

USE eac_hr_db;

-- Ensure baseline designations exist (safe to re-run)
INSERT INTO designation (designation, teaching, employee)
SELECT 'Faculty (Teaching)', 1, 0 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM designation WHERE teaching = 1 LIMIT 1);

INSERT INTO designation (designation, teaching, employee)
SELECT 'Staff (Non-Teaching)', 0, 1 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM designation WHERE employee = 1 AND teaching = 0 LIMIT 1);

SET @desig_faculty := (SELECT Id FROM designation WHERE teaching = 1 ORDER BY Id LIMIT 1);
SET @desig_staff   := (SELECT Id FROM designation WHERE employee = 1 AND teaching = 0 ORDER BY Id LIMIT 1);

SET SESSION SQL_SAFE_UPDATES = 0;

-- Faculty / part-time faculty (PK is employee_id, not id)
UPDATE employee SET designation = @desig_faculty
WHERE employee_id IN ('1-00002','1-00003','1-00004','1-00005','1-00006','1-00008','1-00009')
  AND @desig_faculty IS NOT NULL;

-- Non-faculty staff
UPDATE employee SET designation = @desig_staff
WHERE employee_id IN ('1-00001','1-00007','1-00010')
  AND @desig_staff IS NOT NULL;

SET SESSION SQL_SAFE_UPDATES = 1;

-- Verify payroll will see them
SELECT e.employee_id, e.employee_status, d.designation AS desig_name, d.teaching, d.employee AS non_teaching
FROM employee e
LEFT JOIN designation d ON d.id = e.designation
WHERE e.employee_id BETWEEN '1-00001' AND '1-00010'
ORDER BY e.employee_id;
