-- Remove demo attendance before a full TCMS CSV re-import (avoids duplicate rows).
-- Does NOT touch payroll table. Re-import via HR -> /hr/biometrics.
--
-- PowerShell:
--   Get-Content -Raw "...\sql\clear_demo_attendance_before_reimport.sql" | & "C:\Program Files\MySQL\MySQL Server 9.7\bin\mysql.exe" -u root -p eac_hr_db

USE eac_hr_db;

SET SESSION SQL_SAFE_UPDATES = 0;

DELETE FROM attendance
WHERE employee_id IN (
  '1-00001','1-00002','1-00003','1-00004','1-00005',
  '1-00006','1-00007','1-00008','1-00009','1-00010'
)
AND id > 0;

SET SESSION SQL_SAFE_UPDATES = 1;

SELECT COUNT(*) AS remaining_demo_attendance
FROM attendance
WHERE employee_id LIKE '1-%';
