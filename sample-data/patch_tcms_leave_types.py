"""Set LeaveType on TCMS CSV rows to match sql/sample_leave_requests_aligned_to_attendance.sql."""
import csv
from pathlib import Path

CSV_PATH = Path(__file__).resolve().parent / "tcms_attendance_4_payroll_cycles.csv"

# (employee_id, date dd/mm/yyyy) -> LeaveType
LEAVE_BY_EMP_DATE = {
    ("1-00001", "24/03/2026"): "SL",
    ("1-00002", "14/04/2026"): "VL",
    ("1-00002", "15/04/2026"): "VL",
    ("1-00003", "08/04/2026"): "SL",
    ("1-00003", "06/05/2026"): "SIL",
    ("1-00003", "07/05/2026"): "SIL",
    ("1-00001", "01/05/2026"): "VL",
    ("1-00001", "02/05/2026"): "VL",
}


def main():
    with CSV_PATH.open(encoding="utf-8-sig", newline="") as f:
        reader = csv.DictReader(f)
        fieldnames = reader.fieldnames
        rows = list(reader)

    patched = 0
    for row in rows:
        key = (row.get("Employee ID", "").strip(), row.get("Date", "").strip())
        lt = LEAVE_BY_EMP_DATE.get(key)
        if lt:
            row["LeaveType"] = lt
            row["In"] = ""
            row["Out"] = ""
            patched += 1

    with CSV_PATH.open("w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, quoting=csv.QUOTE_ALL)
        writer.writeheader()
        writer.writerows(rows)

    print(f"Patched {patched} rows in {CSV_PATH.name}")


if __name__ == "__main__":
    main()
