-- Optional: payroll app LeaveBalance entity (not used by EAC HR). Run once on eac_hr_db.
USE eac_hr_db;

CREATE TABLE IF NOT EXISTS `leave_balances` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bereavement_leave_balance` int(11) NOT NULL DEFAULT 0,
  `incentive_leave_balance` int(11) NOT NULL DEFAULT 0,
  `maternity_leave_balance` int(11) NOT NULL DEFAULT 0,
  `paternity_leave_balance` int(11) NOT NULL DEFAULT 0,
  `sick_leave_balance` int(11) NOT NULL DEFAULT 0,
  `solo_parent_leave_balance` int(11) NOT NULL DEFAULT 0,
  `study_leave_balance` int(11) NOT NULL DEFAULT 0,
  `terminal_vl_balance` int(11) NOT NULL DEFAULT 0,
  `vacation_leave_balance` int(11) NOT NULL DEFAULT 0,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_leave_balances_employee` (`employee_id`),
  CONSTRAINT `FK_leave_balances_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
