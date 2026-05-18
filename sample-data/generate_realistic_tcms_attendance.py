"""
Generate TCMS attendance CSV: Jan 1 2026 through May 18 2026.
Aligned with shift assignments, leave_requests, OB, and OT sample data.

Run: python sample-data/generate_realistic_tcms_attendance.py
Then: python sample-data/build_tcms_attendance_xlsx.py
"""
from __future__ import annotations

import csv
import random
from datetime import date, timedelta
from pathlib import Path

BASE = Path(__file__).resolve().parent
OUT = BASE / "tcms_attendance_4_payroll_cycles.csv"

HEADERS = [
    "User ID", "First Name", "Last Name", "Employee ID", "Date",
    "In", "Out", "Short", "OT", "LeaveType", "Work code", "Day type",
]

EMPLOYEES = [
    (2, "Franklin", "Moris", "1-00001", "full"),
    (3, "Gwen Atasha", "Lumagbas", "1-00002", "full"),
    (4, "Maron", "Javier", "1-00003", "part_mwf"),
    (5, "Elena", "Santos", "1-00004", "dean"),
    (6, "Miguel", "Reyes", "1-00005", "full"),
    (7, "Ana", "Cruz", "1-00006", "part_tuth"),
    (8, "Roberto", "Lim", "1-00007", "full"),
    (9, "Maria", "Gonzales", "1-00008", "flex"),
    (10, "James", "Villanueva", "1-00009", "part_mwf"),
    (11, "Patricia", "Ng", "1-00010", "cashier"),
]

# Matches sql/seed_demo_ob_leave_ot_expanded.sql + sample_leave_requests_aligned_to_attendance.sql
LEAVE_DAYS = {
    ("1-00001", "24/03/2026"): "SL",
    ("1-00001", "01/05/2026"): "VL",
    ("1-00001", "02/05/2026"): "VL",
    ("1-00002", "14/04/2026"): "VL",
    ("1-00002", "15/04/2026"): "VL",
    ("1-00003", "08/04/2026"): "SL",
    ("1-00003", "06/05/2026"): "SIL",
    ("1-00003", "07/05/2026"): "SIL",
    ("1-00005", "10/02/2026"): "VL",
    ("1-00005", "11/02/2026"): "VL",
    ("1-00006", "22/01/2026"): "SL",
    ("1-00004", "09/04/2026"): "VL",
    ("1-00004", "01/02/2026"): "VL",
    ("1-00007", "17/03/2026"): "VL",
    ("1-00007", "18/03/2026"): "VL",
    ("1-00008", "21/04/2026"): "SL",
    ("1-00009", "01/05/2026"): "VL",
    ("1-00010", "03/02/2026"): "SL",
}

# Approved/pending OB: partial punches (not LeaveType)
OB_DAYS = {
    ("1-00001", "05/05/2026"): ("09:00", "12:00", "OB"),
    ("1-00002", "08/05/2026"): ("13:00", "17:00", "OB"),
    ("1-00003", "12/05/2026"): ("08:00", "17:00", "OB"),
    ("1-00004", "16/04/2026"): ("08:30", "12:30", "OB"),
    ("1-00005", "03/03/2026"): ("13:00", "17:00", "OB"),
    ("1-00007", "10/02/2026"): ("09:00", "12:00", "OB"),
    ("1-00008", "02/04/2026"): ("09:00", "15:00", "OB"),
    ("1-00009", "07/05/2026"): ("13:00", "17:00", "OB"),
    ("1-00010", "11/05/2026"): ("08:00", "12:00", "OB"),
}

# TCMS OT column + matches eac_overtime_request APPROVED dates
OT_DAYS = {
    ("1-00001", "10/03/2026"): "1.5",
    ("1-00002", "18/02/2026"): "2",
    ("1-00005", "19/03/2026"): "1.5",
    ("1-00005", "14/05/2026"): "2",
    ("1-00007", "15/01/2026"): "1",
    ("1-00004", "05/02/2026"): "1.5",
    ("1-00010", "03/04/2026"): "1.5",
    ("1-00001", "22/04/2026"): "1",
    ("1-00008", "25/03/2026"): "2",
}

RANGE_START = date(2026, 1, 1)
RANGE_END = date(2026, 5, 18)
random.seed(20260518)


def fmt_d(d: date) -> str:
    return f"{d.day:02d}/{d.month:02d}/{d.year}"


def works_on(pattern: str, d: date) -> bool:
    wd = d.weekday()
    if pattern in ("full", "dean", "flex", "cashier"):
        return wd < 5
    if pattern == "part_mwf":
        return wd in (0, 2, 4)
    if pattern == "part_tuth":
        return wd in (1, 3)
    return wd < 5


def base_times(pattern: str) -> tuple[str, str]:
    if pattern == "dean":
        return "08:30", "17:30"
    if pattern == "flex":
        return "09:00", "18:00"
    if pattern == "cashier":
        return "08:00", "17:00"
    if pattern in ("part_mwf", "part_tuth"):
        return "13:00", "17:00"
    return "08:00", "17:00"


def punch_row(pattern: str, d: date, eac: str) -> dict:
    ds = fmt_d(d)
    if (eac, ds) in LEAVE_DAYS:
        return {"In": "", "Out": "", "Short": "", "OT": "", "LeaveType": LEAVE_DAYS[(eac, ds)], "Day type": "Workday"}

    if (eac, ds) in OB_DAYS:
        tin, tout, wc = OB_DAYS[(eac, ds)]
        return {"In": tin, "Out": tout, "Short": "", "OT": "", "LeaveType": "None", "Day type": "Workday", "Work code": wc}

    if not works_on(pattern, d):
        return {"In": "", "Out": "", "Short": "", "OT": "", "LeaveType": "None", "Day type": "Restday", "Work code": ""}

    tin, tout = base_times(pattern)
    short, ot, wc = "", "", ""

    if (eac, ds) in OT_DAYS:
        h = float(OT_DAYS[(eac, ds)])
        if pattern == "dean":
            tout = "19:00" if h >= 1.5 else "18:00"
        elif pattern == "flex":
            tout = "20:00" if h >= 2 else "19:00"
        else:
            tout = "18:30" if h < 2 else "19:00"
        ot = OT_DAYS[(eac, ds)]
    else:
        roll = random.random()
        if roll < 0.06:
            tin = "08:17" if tin.startswith("08") else ("09:22" if tin.startswith("09") else "13:12")
        elif roll < 0.09:
            tout = "16:40"
            short = "20"
        elif roll < 0.04 and (eac, ds) not in OT_DAYS:
            tout = "18:30"
            ot = "1"

    return {"In": tin, "Out": tout, "Short": short, "OT": ot, "LeaveType": "None", "Day type": "Workday", "Work code": wc}


def main():
    rows = []
    d = RANGE_START
    while d <= RANGE_END:
        for uid, fn, ln, eac, pattern in EMPLOYEES:
            p = punch_row(pattern, d, eac)
            rows.append({
                "User ID": str(uid),
                "First Name": fn,
                "Last Name": ln,
                "Employee ID": eac,
                "Date": fmt_d(d),
                "In": p["In"],
                "Out": p["Out"],
                "Short": p["Short"],
                "OT": p["OT"],
                "LeaveType": p["LeaveType"],
                "Work code": p.get("Work code", ""),
                "Day type": p["Day type"],
            })
        d += timedelta(days=1)

    with OUT.open("w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=HEADERS, quoting=csv.QUOTE_ALL)
        w.writeheader()
        w.writerows(rows)

    print(f"Wrote {len(rows)} rows -> {OUT.name}")
    print(f"  Leave days: {len(LEAVE_DAYS)}, OB partial: {len(OB_DAYS)}, OT: {len(OT_DAYS)}")


if __name__ == "__main__":
    main()
