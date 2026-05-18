-- Remap legacy numeric employee_id (1, 2, 3) to EAC format (1-00001, 1-00002, 1-00003)
-- in payroll-related child tables. Safe to re-run (only updates exact legacy values).
-- Run: mysql -u root -p eac_hr_db < sql/align_payroll_tables_to_eac_employee_id.sql

USE eac_hr_db;

SET FOREIGN_KEY_CHECKS = 0;

-- VARCHAR columns storing '1' / '2' / '3'
UPDATE payroll       SET employee_id = '1-00001' WHERE employee_id IN ('1', 1);
UPDATE payroll       SET employee_id = '1-00002' WHERE employee_id IN ('2', 2);
UPDATE payroll       SET employee_id = '1-00003' WHERE employee_id IN ('3', 3);

UPDATE teaching_pay  SET employee_id = '1-00001' WHERE employee_id IN ('1', 1);
UPDATE teaching_pay  SET employee_id = '1-00002' WHERE employee_id IN ('2', 2);
UPDATE teaching_pay  SET employee_id = '1-00003' WHERE employee_id IN ('3', 3);

UPDATE teaching_load SET employee_id = '1-00001' WHERE employee_id IN ('1', 1);
UPDATE teaching_load SET employee_id = '1-00002' WHERE employee_id IN ('2', 2);
UPDATE teaching_load SET employee_id = '1-00003' WHERE employee_id IN ('3', 3);

UPDATE loans         SET employee_id = '1-00001' WHERE employee_id IN ('1', 1);
UPDATE loans         SET employee_id = '1-00002' WHERE employee_id IN ('2', 2);
UPDATE loans         SET employee_id = '1-00003' WHERE employee_id IN ('3', 3);

UPDATE suspension    SET employee_id = '1-00001' WHERE employee_id IN ('1', 1);
UPDATE suspension    SET employee_id = '1-00002' WHERE employee_id IN ('2', 2);
UPDATE suspension    SET employee_id = '1-00003' WHERE employee_id IN ('3', 3);

UPDATE leave_requests SET employee_id = '1-00001' WHERE employee_id IN ('1', 1);
UPDATE leave_requests SET employee_id = '1-00002' WHERE employee_id IN ('2', 2);
UPDATE leave_requests SET employee_id = '1-00003' WHERE employee_id IN ('3', 3);

UPDATE employee_leaves SET employee_id = '1-00001' WHERE employee_id IN ('1', 1);
UPDATE employee_leaves SET employee_id = '1-00002' WHERE employee_id IN ('2', 2);
UPDATE employee_leaves SET employee_id = '1-00003' WHERE employee_id IN ('3', 3);

-- Attendance: numeric-only keys (do not touch rows already 1-00001)
UPDATE attendance SET employee_id = '1-00001' WHERE employee_id = '1';
UPDATE attendance SET employee_id = '1-00002' WHERE employee_id = '2';
UPDATE attendance SET employee_id = '1-00003' WHERE employee_id = '3';

SET FOREIGN_KEY_CHECKS = 1;

SELECT 'payroll' AS tbl, employee_id, COUNT(*) AS cnt FROM payroll GROUP BY employee_id;
SELECT 'teaching_pay' AS tbl, employee_id, COUNT(*) AS cnt FROM teaching_pay GROUP BY employee_id;
SELECT 'leave_requests' AS tbl, employee_id, COUNT(*) AS cnt FROM leave_requests GROUP BY employee_id;
