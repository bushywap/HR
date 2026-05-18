"""Build TCMS attendance Excel from CSV (run: python build_tcms_attendance_xlsx.py)."""
import csv
from pathlib import Path

from openpyxl import Workbook
from openpyxl.styles import Alignment, Font, PatternFill
from openpyxl.utils import get_column_letter

BASE = Path(__file__).resolve().parent
CSV_PATH = BASE / "tcms_attendance_4_payroll_cycles.csv"
XLSX_PATH = BASE / "tcms_attendance_4_payroll_cycles.xlsx"
XLSX_PASTE_PATH = BASE / "EAC_Attendance_4_Cycles.xlsx"

CYCLES = [
    ("Jan 1-15 2026", "2026-01-01", "2026-01-15"),
    ("Jan 16-31 2026", "2026-01-16", "2026-01-31"),
    ("Feb 1-15 2026", "2026-02-01", "2026-02-15"),
    ("Feb 16-28 2026", "2026-02-16", "2026-02-28"),
    ("Mar 1-15 2026", "2026-03-01", "2026-03-15"),
    ("Mar 16-31 2026", "2026-03-16", "2026-03-31"),
    ("Apr 1-15 2026", "2026-04-01", "2026-04-15"),
    ("Apr 16-30 2026", "2026-04-16", "2026-04-30"),
    ("May 1-18 2026", "2026-05-01", "2026-05-18"),
]

HEADERS = [
    "User ID",
    "First Name",
    "Last Name",
    "Employee ID",
    "Date",
    "In",
    "Out",
    "Short",
    "OT",
    "LeaveType",
    "Work code",
    "Day type",
]


def parse_csv_date(s: str):
    d, m, y = s.strip().split("/")
    return f"{y}-{m.zfill(2)}-{d.zfill(2)}"


def in_cycle(iso: str, start: str, end: str) -> bool:
    return start <= iso <= end


def load_rows():
    with CSV_PATH.open(encoding="utf-8-sig", newline="") as f:
        reader = csv.DictReader(f)
        rows = list(reader)
    return rows


def style_header(ws, row=1):
    fill = PatternFill("solid", fgColor="8B1538")
    font = Font(bold=True, color="FFFFFF")
    for col in range(1, len(HEADERS) + 1):
        cell = ws.cell(row=row, column=col)
        cell.fill = fill
        cell.font = font
        cell.alignment = Alignment(horizontal="center", vertical="center")


def write_sheet(ws, title_rows, data_rows):
    ws.append(HEADERS)
    style_header(ws)
    for r in data_rows:
        ws.append([r.get(h, "") for h in HEADERS])
    for col in range(1, len(HEADERS) + 1):
        ws.column_dimensions[get_column_letter(col)].width = 14
    ws.column_dimensions["B"].width = 16
    ws.column_dimensions["C"].width = 16
    ws.column_dimensions["D"].width = 14
    ws.freeze_panes = "A2"


def main():
    all_rows = load_rows()
    wb = Workbook()
    # All data
    ws_all = wb.active
    ws_all.title = "All cycles (import)"
    write_sheet(ws_all, None, all_rows)

    for sheet_name, start, end in CYCLES:
        short = sheet_name.split("(")[0].strip()[:31]
        ws = wb.create_sheet(short)
        filtered = [
            r
            for r in all_rows
            if r.get("Date") and in_cycle(parse_csv_date(r["Date"]), start, end)
        ]
        write_sheet(ws, None, filtered)

    wb.save(XLSX_PATH)

    # Single-sheet workbook for copy/paste in Excel (no CSV needed to open)
    wb_paste = Workbook()
    ws_p = wb_paste.active
    ws_p.title = "Attendance"
    write_sheet(ws_p, None, all_rows)
    wb_paste.save(XLSX_PASTE_PATH)

    print(f"Wrote {XLSX_PATH} ({len(all_rows)} rows, {len(wb.sheetnames)} sheets)")
    print(f"Wrote {XLSX_PASTE_PATH} (single sheet — open and copy all)")


if __name__ == "__main__":
    main()
