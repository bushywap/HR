-- Run once on eac_hr_db so attendance uses the same id as custom_employee_id (1-00001, etc.)
USE eac_hr_db;

UPDATE attendance a
INNER JOIN employee e ON a.employee_id = CAST(e.employee_id AS CHAR)
SET a.employee_id = e.custom_employee_id
WHERE e.custom_employee_id IS NOT NULL
  AND TRIM(e.custom_employee_id) <> ''
  AND a.employee_id <> e.custom_employee_id;

-- Verify:
-- SELECT e.custom_employee_id, a.employee_id, COUNT(*) FROM attendance a
-- JOIN employee e ON a.employee_id = e.custom_employee_id GROUP BY 1, 2;
