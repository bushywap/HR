-- Use EAC employee id (e.g. 1-00001) as employee.employee_id PK; drop custom_employee_id.
-- Run: mysql -u root -p eac_hr_db < sql/migrate_employee_id_to_eac_format.sql

USE eac_hr_db;

SET FOREIGN_KEY_CHECKS = 0;

-- Child tables still storing numeric legacy ids
UPDATE leave_requests SET employee_id = '1-00001' WHERE employee_id = 1;
UPDATE leave_requests SET employee_id = '1-00002' WHERE employee_id = 2;
UPDATE leave_requests SET employee_id = '1-00003' WHERE employee_id = 3;

UPDATE employee_leaves SET employee_id = '1-00001' WHERE employee_id = 1;
UPDATE employee_leaves SET employee_id = '1-00002' WHERE employee_id = 2;
UPDATE employee_leaves SET employee_id = '1-00003' WHERE employee_id = 3;

UPDATE eac_official_business_request SET employee_id = '1-00001' WHERE employee_id = 1;
UPDATE eac_official_business_request SET employee_id = '1-00002' WHERE employee_id = 2;
UPDATE eac_official_business_request SET employee_id = '1-00003' WHERE employee_id = 3;

UPDATE eac_overtime_request SET employee_id = '1-00001' WHERE employee_id = 1;
UPDATE eac_overtime_request SET employee_id = '1-00002' WHERE employee_id = 2;
UPDATE eac_overtime_request SET employee_id = '1-00003' WHERE employee_id = 3;

UPDATE loans SET employee_id = '1-00001' WHERE employee_id = 1;
UPDATE loans SET employee_id = '1-00002' WHERE employee_id = 2;
UPDATE loans SET employee_id = '1-00003' WHERE employee_id = 3;

UPDATE payroll SET employee_id = '1-00001' WHERE employee_id = 1;
UPDATE payroll SET employee_id = '1-00002' WHERE employee_id = 2;
UPDATE payroll SET employee_id = '1-00003' WHERE employee_id = 3;

UPDATE suspension SET employee_id = '1-00001' WHERE employee_id = 1;
UPDATE suspension SET employee_id = '1-00002' WHERE employee_id = 2;
UPDATE suspension SET employee_id = '1-00003' WHERE employee_id = 3;

UPDATE teaching_load SET employee_id = '1-00001' WHERE employee_id = 1;
UPDATE teaching_load SET employee_id = '1-00002' WHERE employee_id = 2;
UPDATE teaching_load SET employee_id = '1-00003' WHERE employee_id = 3;

UPDATE teaching_pay SET employee_id = '1-00001' WHERE employee_id = 1;
UPDATE teaching_pay SET employee_id = '1-00002' WHERE employee_id = 2;
UPDATE teaching_pay SET employee_id = '1-00003' WHERE employee_id = 3;

UPDATE shift_assignment SET employee_id = '1-00001' WHERE employee_id = '1';
UPDATE shift_assignment SET employee_id = '1-00002' WHERE employee_id = '2';
UPDATE shift_assignment SET employee_id = '1-00003' WHERE employee_id = '3';

-- Promote custom id to primary employee_id
UPDATE employee e
SET employee_id = e.custom_employee_id
WHERE e.custom_employee_id IS NOT NULL AND TRIM(e.custom_employee_id) <> '';

ALTER TABLE leave_requests MODIFY employee_id VARCHAR(20) NOT NULL;
ALTER TABLE employee_leaves MODIFY employee_id VARCHAR(20) NOT NULL;
ALTER TABLE eac_official_business_request MODIFY employee_id VARCHAR(20) NOT NULL;
ALTER TABLE eac_overtime_request MODIFY employee_id VARCHAR(20) NOT NULL;
ALTER TABLE loans MODIFY employee_id VARCHAR(20) NOT NULL;
ALTER TABLE payroll MODIFY employee_id VARCHAR(20) NOT NULL;
ALTER TABLE suspension MODIFY employee_id VARCHAR(20) NOT NULL;
ALTER TABLE teaching_load MODIFY employee_id VARCHAR(20) NOT NULL;
ALTER TABLE teaching_pay MODIFY employee_id VARCHAR(20) NOT NULL;

ALTER TABLE employee DROP INDEX UKhh0taad2bdg5usifdiju7nubo;
ALTER TABLE employee DROP COLUMN custom_employee_id;

SET FOREIGN_KEY_CHECKS = 1;

SELECT employee_id, first_name, last_name FROM employee;
