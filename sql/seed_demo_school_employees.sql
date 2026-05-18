-- Demo school roster: faculty, non-faculty, part-time + filled 201 (CS Form 201) fields.
-- Also creates employee portal logins (username = EAC id, password = password).
--
-- Run after eac_hr_db exists and department codes (SON, SET, SAS, SBE, SOT) are present:
--   cmd /c ""C:\Program Files\MySQL\MySQL Server 9.7\bin\mysql.exe" -u root -p eac_hr_db < "C:\...\sql\seed_demo_school_employees.sql""
--
-- Then (optional): sql/seed_demo_shift_schedules.sql
-- Regenerate attendance: python sample-data/generate_realistic_tcms_attendance.py

USE eac_hr_db;

SET NAMES utf8mb4;

-- bcrypt for literal password: password
SET @emp_pw = '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi';

-- ---------------------------------------------------------------------------
-- Enrich existing sample employees (201 + employment profile)
-- ---------------------------------------------------------------------------
UPDATE employee SET
  status = 'Active',
  employee_status = 'Full-Time Non-Faculty',
  department_code = 'SOT',
  position = 'HR Information Systems Staff',
  phone = '09171234501',
  gender = 'Male',
  civil_status = 'Single',
  birth_date = '1992-04-12',
  birth_place = 'Manila',
  nationality = 'Filipino',
  present_address = '12 M. Cruz St., Brgy. San Antonio, Pasig City',
  permanent_address = '12 M. Cruz St., Brgy. San Antonio, Pasig City',
  date_hired = '2019-06-01',
  payment_type = 'Semi-Monthly',
  expected_shift = 'Admin Day (08:00-17:00)',
  basic_salary = 28000.00,
  daily_wage = 1076.92,
  hourly_rate = 134.62,
  biometric_id = 2,
  vl_balance = 12, sl_balance = 12,
  emergency_contact_name = 'Rosa Moris',
  emergency_contact_phone = '09181112201',
  emergency_contact_relationship = 'Mother',
  highest_degree = 'BS Information Technology',
  years_experience = 6,
  experience_text = 'Campus IT; prior LGU systems support.',
  previous_employer = 'Private IT firm',
  sss_number = '34-1234567-8',
  tin_number = '123-456-789-000',
  philhealth_number = '12-345678901-2',
  pagibig_number = '1212-3456-7890'
WHERE employee_id = '1-00001';

UPDATE employee SET
  status = 'Active',
  employee_status = 'Full-Time Faculty',
  department_code = 'SON',
  position = 'Department Head (Acting)',
  phone = '09171234502',
  gender = 'Female',
  civil_status = 'Single',
  birth_date = '1990-08-20',
  birth_place = 'Cavite',
  nationality = 'Filipino',
  present_address = 'Blk 2 Lot 8 Greenfield, Imus, Cavite',
  permanent_address = 'Blk 2 Lot 8 Greenfield, Imus, Cavite',
  date_hired = '2015-01-15',
  payment_type = 'Semi-Monthly',
  expected_shift = 'Admin Day (08:00-17:00)',
  basic_salary = 45000.00,
  daily_wage = 1730.77,
  hourly_rate = 216.35,
  biometric_id = 3,
  vl_balance = 15, sl_balance = 15, ml_balance = 105,
  emergency_contact_name = 'Lita Lumagbas',
  emergency_contact_phone = '09181112202',
  emergency_contact_relationship = 'Spouse',
  highest_degree = 'MS Nursing',
  years_experience = 11,
  experience_text = 'Clinical instructor; SET program coordination.',
  previous_employer = 'Private hospital',
  sss_number = '34-2345678-9',
  tin_number = '234-567-890-001',
  philhealth_number = '12-456789012-3',
  pagibig_number = '1212-4567-8901'
WHERE employee_id = '1-00002';

UPDATE employee SET
  status = 'Active',
  employee_status = 'Part-Time Non-Faculty',
  department_code = 'SAS',
  position = 'Maintenance Technician',
  phone = '09171234503',
  gender = 'Male',
  civil_status = 'Married',
  birth_date = '1988-11-03',
  birth_place = 'Laguna',
  nationality = 'Filipino',
  present_address = 'Purok 3, Sta. Rosa, Laguna',
  permanent_address = 'Purok 3, Sta. Rosa, Laguna',
  date_hired = '2022-08-01',
  payment_type = 'Semi-Monthly',
  expected_shift = 'Part-Time PM (13:00-17:00)',
  basic_salary = NULL,
  daily_wage = 650.00,
  hourly_rate = 162.50,
  biometric_id = 4,
  vl_balance = 5, sl_balance = 5,
  emergency_contact_name = 'Grace Javier',
  emergency_contact_phone = '09181112203',
  emergency_contact_relationship = 'Spouse',
  highest_degree = 'BS Industrial Technology',
  years_experience = 4,
  experience_text = 'Facilities maintenance; MWF schedule.',
  previous_employer = 'Condominium estate',
  sss_number = '34-3456789-0',
  tin_number = '345-678-901-002',
  philhealth_number = '12-567890123-4',
  pagibig_number = '1212-5678-9012'
WHERE employee_id = '1-00003';

-- ---------------------------------------------------------------------------
-- New employees (1-00004 .. 1-00010)
-- ---------------------------------------------------------------------------
INSERT INTO employee (
  employee_id, first_name, last_name, email, status, employee_status,
  department_code, position, phone, gender, civil_status,
  birth_date, birth_place, nationality, present_address, permanent_address,
  date_hired, payment_type, expected_shift, basic_salary, daily_wage, hourly_rate,
  biometric_id, vl_balance, sl_balance, ml_balance, pl_balance, spl_balance, bl_balance,
  incentive_leave_balance, study_leave_balance,
  emergency_contact_name, emergency_contact_phone, emergency_contact_relationship,
  highest_degree, years_experience, experience_text, previous_employer,
  sss_number, tin_number, philhealth_number, pagibig_number
) VALUES
('1-00004', 'Elena', 'Santos', 'elena.santos.demo@eac.edu.ph', 'Active', 'Full-Time Faculty',
 'SBE', 'Dean - School of Business Education', '09171234504', 'Female', 'Married',
 '1975-02-14', 'Quezon City', 'Filipino', '45 University Ave., Manila', '45 University Ave., Manila',
 '2010-05-01', 'Semi-Monthly', 'Dean (08:30-17:30)', 75000.00, 2884.62, 360.58,
 5, 20, 20, 0, 7, 7, 3, 5, 0,
 'Antonio Santos', '09181112204', 'Spouse',
 'DBA Business Administration', 22, 'Former program chair; accreditor liaison.',
 'Private university', '34-4567890-1', '456-789-012-003', '12-678901234-5', '1212-6789-0123'),

('1-00005', 'Miguel', 'Reyes', 'miguel.reyes.demo@eac.edu.ph', 'Active', 'Full-Time Faculty',
 'SET', 'Associate Professor', '09171234505', 'Male', 'Married',
 '1982-07-30', 'Batangas', 'Filipino', 'Unit 5B Tower 1, BGC, Taguig', 'Unit 5B Tower 1, BGC, Taguig',
 '2012-06-15', 'Semi-Monthly', 'Admin Day (08:00-17:00)', 52000.00, 2000.00, 250.00,
 6, 15, 15, 0, 7, 0, 3, 5, 2,
 'Carla Reyes', '09181112205', 'Spouse',
 'MS Computer Engineering', 14, 'Industry consulting; capstone adviser.',
 'Tech corporation', '34-5678901-2', '567-890-123-004', '12-789012345-6', '1212-7890-1234'),

('1-00006', 'Ana', 'Cruz', 'ana.cruz.demo@eac.edu.ph', 'Active', 'Part-Time Faculty',
 'SON', 'Clinical Instructor', '09171234506', 'Female', 'Single',
 '1995-12-01', 'Manila', 'Filipino', '88 Sampaguita St., Quezon City', '88 Sampaguita St., Quezon City',
 '2023-01-09', 'Semi-Monthly', 'Part-Time Tue-Thu (13:00-17:00)', NULL, 800.00, 200.00,
 7, 5, 5, 0, 0, 0, 0, 0, 0,
 'Teresa Cruz', '09181112206', 'Mother',
 'BS Nursing', 3, 'RLE supervision; Tue/Thu teaching load only.',
 'Community hospital', '34-6789012-3', '678-901-234-005', '12-890123456-7', '1212-8901-2345'),

('1-00007', 'Roberto', 'Lim', 'roberto.lim.demo@eac.edu.ph', 'Active', 'Full-Time Non-Faculty',
 'SAS', 'University Registrar - Records Officer', '09171234507', 'Male', 'Married',
 '1980-03-22', 'Bulacan', 'Filipino', '10 Malolos Rd., Malolos, Bulacan', '10 Malolos Rd., Malolos, Bulacan',
 '2016-09-01', 'Semi-Monthly', 'Admin Day (08:00-17:00)', 32000.00, 1230.77, 153.85,
 8, 15, 15, 0, 0, 0, 3, 5, 0,
 'Jenny Lim', '09181112207', 'Spouse',
 'BS Office Administration', 9, 'TOR encoding; enrollment records.',
 'College registrar office', '34-7890123-4', '789-012-345-006', '12-901234567-8', '1212-9012-3456'),

('1-00008', 'Maria', 'Gonzales', 'maria.gonzales.demo@eac.edu.ph', 'Active', 'Full-Time Non-Faculty',
 'SBE', 'HR Officer II', '09171234508', 'Female', 'Single',
 '1993-05-18', 'Pasig', 'Filipino', '22 Ortigas Ave., Pasig City', '22 Ortigas Ave., Pasig City',
 '2020-02-17', 'Semi-Monthly', 'Flex Admin (09:00-18:00)', 30000.00, 1153.85, 144.23,
 9, 12, 12, 0, 0, 7, 3, 5, 0,
 'Lourdes Gonzales', '09181112208', 'Mother',
 'BS Psychology', 5, 'Recruitment; 201 file maintenance.',
 'BPO HR shared services', '34-8901234-5', '890-123-456-007', '12-012345678-9', '1212-0123-4567'),

('1-00009', 'James', 'Villanueva', 'james.villanueva.demo@eac.edu.ph', 'Active', 'Part-Time Faculty',
 'SOT', 'Lecturer - Physical Therapy', '09171234509', 'Male', 'Single',
 '1991-09-09', 'Pampanga', 'Filipino', 'Lot 3 Phase 2, Angeles City', 'Lot 3 Phase 2, Angeles City',
 '2024-06-01', 'Semi-Monthly', 'Part-Time MWF (13:00-17:00)', NULL, 850.00, 212.50,
 10, 5, 5, 0, 0, 0, 0, 0, 0,
 'Elena Villanueva', '09181112209', 'Mother',
 'BS Physical Therapy', 4, 'Skills lab; MWF load.',
 'Rehabilitation center', '34-9012345-6', '901-234-567-008', '12-123456789-0', '1212-1234-5678'),

('1-00010', 'Patricia', 'Ng', 'patricia.ng.demo@eac.edu.ph', 'Active', 'Full-Time Non-Faculty',
 'SAS', 'Cashier III', '09171234510', 'Female', 'Married',
 '1987-01-25', 'Manila', 'Filipino', '5-B U.N. Ave., Manila', '5-B U.N. Ave., Manila',
 '2018-04-02', 'Semi-Monthly', 'Cashier Window (08:00-17:00)', 26000.00, 1000.00, 125.00,
 11, 15, 15, 0, 0, 0, 3, 5, 0,
 'Henry Ng', '09181112210', 'Spouse',
 'BS Accountancy', 8, 'Tuition assessment; OR issuance.',
 'Retail chain finance', '34-0123456-7', '012-345-678-009', '12-234567890-1', '1212-2345-6789')
ON DUPLICATE KEY UPDATE
  first_name = VALUES(first_name),
  last_name = VALUES(last_name),
  email = VALUES(email),
  status = VALUES(status),
  employee_status = VALUES(employee_status),
  department_code = VALUES(department_code),
  position = VALUES(position),
  phone = VALUES(phone),
  expected_shift = VALUES(expected_shift),
  basic_salary = VALUES(basic_salary),
  daily_wage = VALUES(daily_wage),
  biometric_id = VALUES(biometric_id);

-- Employee portal accounts (login: EAC id / password)
INSERT INTO app_users (username, password, role)
SELECT v.u, @emp_pw, 'EMPLOYEE' FROM (
  SELECT '1-00001' AS u UNION ALL SELECT '1-00002' UNION ALL SELECT '1-00003'
  UNION ALL SELECT '1-00004' UNION ALL SELECT '1-00005' UNION ALL SELECT '1-00006'
  UNION ALL SELECT '1-00007' UNION ALL SELECT '1-00008' UNION ALL SELECT '1-00009'
  UNION ALL SELECT '1-00010'
) AS v
WHERE NOT EXISTS (SELECT 1 FROM app_users a WHERE a.username = v.u);

-- Extra leave rows for new hires (aligned with CSV generator)
INSERT INTO leave_requests
  (employee_id, leave_type, start_date, end_date, total_days, status, reason,
   next_approver, last_action_by, decided_at, created_date)
SELECT v.employee_id, v.leave_type, v.start_date, v.end_date, v.total_days, v.status, v.reason,
       'HR', v.last_action_by, v.decided_at, v.created_date
FROM (
  SELECT '1-00005' AS employee_id, 'Vacation Leave' AS leave_type,
         DATE('2026-02-10') AS start_date, DATE('2026-02-11') AS end_date,
         2 AS total_days, 'APPROVED' AS status, 'Semestral break travel' AS reason,
         'HR Admin' AS last_action_by, TIMESTAMP('2026-02-05 10:00:00') AS decided_at,
         DATE('2026-02-01') AS created_date
  UNION ALL
  SELECT '1-00006', 'Sick Leave', DATE('2026-01-22'), DATE('2026-01-22'), 1, 'APPROVED',
         'Medical rest', 'HR Admin', TIMESTAMP('2026-01-21 09:00:00'), DATE('2026-01-21')
  UNION ALL
  SELECT '1-00004', 'Vacation Leave', DATE('2026-04-09'), DATE('2026-04-09'), 1, 'APPROVED',
         'Accreditation conference', 'HR Admin', TIMESTAMP('2026-04-01 14:00:00'), DATE('2026-03-28')
) AS v
WHERE EXISTS (SELECT 1 FROM employee e WHERE e.employee_id = v.employee_id)
  AND NOT EXISTS (
    SELECT 1 FROM leave_requests lr
    WHERE lr.employee_id = v.employee_id AND lr.start_date = v.start_date
      AND lr.end_date = v.end_date AND lr.leave_type = v.leave_type
  );

SELECT employee_id, CONCAT(first_name, ' ', last_name) AS name, employee_status, department_code, position
FROM employee
WHERE employee_id BETWEEN '1-00001' AND '1-00010'
ORDER BY employee_id;
