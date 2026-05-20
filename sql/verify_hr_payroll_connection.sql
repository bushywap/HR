-- Verify Option A: HR and payroll share eac_hr_db (HR writes, payroll reads).
-- Run in MySQL Workbench after HR import + payroll Calculate/Send.

USE eac_hr_db;

-- 1) HR demo roster (source of truth for employee master)
SELECT '1. HR employees (employee table)' AS step;
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS name,
       employee_status, department_code, basic_salary, status
FROM employee
WHERE employee_id LIKE '1-%'
ORDER BY employee_id;

-- 2) HR attendance (TCMS import via /hr/biometrics)
SELECT '2. HR attendance summary' AS step;
SELECT COUNT(*) AS total_rows,
       MIN(`date`) AS first_day, MAX(`date`) AS last_day
FROM attendance
WHERE employee_id LIKE '1-%';

SELECT employee_id, COUNT(*) AS days_in_apr_2026
FROM attendance
WHERE employee_id LIKE '1-%'
  AND `date` BETWEEN '2026-04-01' AND '2026-04-15'
GROUP BY employee_id
ORDER BY employee_id;

-- 3) HR leave (approved — payroll may deduct/count)
SELECT '3. HR approved leave (sample)' AS step;
SELECT employee_id, leave_type, start_date, end_date, status
FROM leave_requests
WHERE employee_id LIKE '1-%' AND status = 'APPROVED'
ORDER BY start_date
LIMIT 15;

-- 4) Payroll reads same employee_id FK
SELECT '4. Payroll records for demo employees' AS step;
SELECT p.employee_id, e.first_name, e.last_name,
       p.pay_period_start, p.pay_period_end, p.net_pay, p.status
FROM payroll p
JOIN employee e ON e.employee_id = p.employee_id
WHERE p.employee_id LIKE '1-%'
ORDER BY p.pay_period_start DESC, p.employee_id
LIMIT 20;

-- 4b) Compensation tab check (payroll UI classifies by designation.teaching, not dept name)
SELECT e.employee_id,
       CASE WHEN d.teaching = 1 THEN 'FACULTY tab' ELSE 'NON-FACULTY tab' END AS compensation_tab
FROM employee e
LEFT JOIN designation d ON d.id = e.designation
WHERE e.employee_id LIKE '1-%'
ORDER BY e.employee_id;

-- 5) Connection proof: one employee end-to-end
SELECT '5. End-to-end: 1-00001 (HR -> payroll)' AS step;
SELECT e.employee_id, e.basic_salary AS hr_basic_salary,
       (SELECT COUNT(*) FROM attendance a
        WHERE a.employee_id = e.employee_id
          AND a.`date` BETWEEN '2026-04-01' AND '2026-04-15') AS hr_attendance_days_apr1_15,
       (SELECT p.net_pay FROM payroll p
        WHERE p.employee_id = e.employee_id
          AND p.pay_period_start = '2026-04-01'
          AND p.pay_period_end = '2026-04-15'
        LIMIT 1) AS payroll_net_apr1_15
FROM employee e
WHERE e.employee_id = '1-00001';
