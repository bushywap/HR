"""Generate sql/seed_demo_shift_assignments.sql for Jan 1 - May 18 2026."""
from __future__ import annotations

from datetime import date, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "sql" / "seed_demo_shift_assignments.sql"

RANGE_START = date(2026, 1, 1)
RANGE_END = date(2026, 5, 18)

# EAC id -> shift_schedule.name (must match seed_demo_shift_schedules.sql)
SHIFT_NAME = {
    "1-00001": "Admin Day (08:00-17:00)",
    "1-00002": "Admin Day (08:00-17:00)",
    "1-00003": "Part-Time PM (13:00-17:00)",
    "1-00004": "Dean (08:30-17:30)",
    "1-00005": "Admin Day (08:00-17:00)",
    "1-00006": "Part-Time Tue-Thu (13:00-17:00)",
    "1-00007": "Admin Day (08:00-17:00)",
    "1-00008": "Flex Admin (09:00-18:00)",
    "1-00009": "Part-Time MWF (13:00-17:00)",
    "1-00010": "Cashier Window (08:00-17:00)",
}

PATTERN = {
    "1-00001": "full",
    "1-00002": "full",
    "1-00003": "part_mwf",
    "1-00004": "dean",
    "1-00005": "full",
    "1-00006": "part_tuth",
    "1-00007": "full",
    "1-00008": "flex",
    "1-00009": "part_mwf",
    "1-00010": "cashier",
}


def works_on(pattern: str, d: date) -> bool:
    wd = d.weekday()
    if pattern in ("full", "dean", "flex", "cashier"):
        return wd < 5
    if pattern == "part_mwf":
        return wd in (0, 2, 4)
    if pattern == "part_tuth":
        return wd in (1, 3)
    return wd < 5


def main():
    lines = [
        "-- Auto-generated: sample-data/build_demo_shift_assignments_sql.py",
        "-- Assigns one shift per employee per workday (Jan-May 2026). Required for TCMS late/OT rules.",
        "-- Run: Get-Content -Raw sql\\seed_demo_shift_assignments.sql | & mysql.exe -u root -p eac_hr_db",
        "",
        "USE eac_hr_db;",
        "",
        "DELETE FROM shift_assignment WHERE source = 'seed';",
        "",
    ]

    d = RANGE_START
    batch = []
    while d <= RANGE_END:
        iso = d.isoformat()
        for eac, shift_name in SHIFT_NAME.items():
            if not works_on(PATTERN[eac], d):
                continue
            esc_name = shift_name.replace("'", "''")
            batch.append(
                f"SELECT '{eac}' AS employee_id, "
                f"(SELECT id FROM shift_schedule WHERE name = '{esc_name}' AND is_active = 1 LIMIT 1) AS shift_id, "
                f"DATE('{iso}') AS work_date"
            )
        d += timedelta(days=1)

    # Insert in chunks via INSERT ... SELECT ... UNION ALL
    chunk_size = 80
    for i in range(0, len(batch), chunk_size):
        chunk = batch[i : i + chunk_size]
        union = "\nUNION ALL\n".join(chunk)
        lines.append(
            "INSERT INTO shift_assignment "
            "(employee_id, shift_id, work_date, source, created_by, updated_by, created_at, updated_at)\n"
            f"SELECT v.employee_id, v.shift_id, v.work_date, 'seed', 'seed', 'seed', NOW(), NOW()\n"
            f"FROM (\n{union}\n) AS v\n"
            "WHERE v.shift_id IS NOT NULL\n"
            "ON DUPLICATE KEY UPDATE shift_id = VALUES(shift_id), source = 'seed', updated_at = NOW();\n"
        )

    lines.append(
        "SELECT employee_id, COUNT(*) AS assignment_days\n"
        "FROM shift_assignment WHERE source = 'seed'\n"
        "GROUP BY employee_id ORDER BY employee_id;\n"
    )

    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {OUT} ({len(batch)} assignment rows)")


if __name__ == "__main__":
    main()
