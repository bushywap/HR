-- Sample Official Business + leave rows for HR approval workflows (EAC employee ids).
-- Run: mysql -u root -p eac_hr_db < sql/sample_ob_leave_for_hr_processing.sql

USE eac_hr_db;

-- Official Business (empty table → demo pending / approved / rejected)
INSERT INTO eac_official_business_request
  (employee_id, business_date, start_time, end_time, ob_hours, purpose, status,
   next_approver, last_action_by, request_source, notes, created_at, decided_at)
VALUES
  ('1-00001', '2026-05-05', '09:00:00', '12:00:00', 3,
   'Registrar records verification - Main campus', 'PENDING', 'HR', NULL, 'MANUAL',
   'Sample: approve in Official Business admin', NOW(), NULL),
  ('1-00002', '2026-05-08', '13:00:00', '17:00:00', 4,
   'Industry partner meeting — Cavite site visit', 'PENDING', 'HR', NULL, 'MANUAL',
   'Sample: pending OB', NOW(), NULL),
  ('1-00003', '2026-05-12', '08:00:00', '17:00:00', 8,
   'BIR / government agency - document submission', 'APPROVED', 'HR', 'HR Admin', 'MANUAL',
   'Sample: already approved', NOW(), NOW()),
  ('1-00001', '2026-05-15', '10:00:00', '14:00:00', 4,
   'Accreditation site visit support', 'REJECTED', 'HR', 'HR Admin', 'EMPLOYEE',
   'Sample: incomplete travel order', NOW(), NOW());

-- For leave + attendance aligned to TCMS sample, run:
--   sql/sample_leave_requests_aligned_to_attendance.sql

SELECT status, COUNT(*) AS cnt FROM eac_official_business_request GROUP BY status;
SELECT status, COUNT(*) AS cnt FROM leave_requests GROUP BY status;
