#!/usr/bin/env python3
"""Fix mojibake in Thymeleaf HTML templates."""
from __future__ import annotations

import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1] / "src" / "main" / "resources" / "templates"

HAMBURGER = (
    '<i class="fas fa-bars" aria-hidden="true"></i>'
    '<span class="visually-hidden">Menu</span>'
)
ARROW = '<i class="fas fa-arrow-left me-1" aria-hidden="true"></i>'


def try_repair_mojibake(text: str) -> str:
    prev = None
    cur = text
    for _ in range(3):
        if cur == prev:
            break
        prev = cur
        try:
            cur = cur.encode("cp1252").decode("utf-8")
        except (UnicodeDecodeError, UnicodeEncodeError):
            break
    return cur


def fix_content(text: str) -> str:
    # Hamburger menu (UTF-8 U+2630 misread)
    text = text.replace("\u00e2\u02dc\u00b0", HAMBURGER)  # â˜°
    text = text.replace("\u00e2\u02dc\u00ba", HAMBURGER)  # â˜º

    # Common punctuation (UTF-8 misread as cp1252)
    replacements = {
        "\u00e2\u20ac\u201d": "\u2014",  # em dash
        "\u00e2\u20ac\u201c": "\u2013",  # en dash
        "\u00e2\u20ac\u00a6": "\u2026",  # ellipsis
        "\u00e2\u20ac\u00b9": "\u2039",  # single left angle
        "\u00e2\u20ac\u00ba": "\u203a",  # single right angle
        "\u00e2\u20ac\u0153": "\u201c",  # left double quote
        "\u00e2\u20ac\u009d": "\u201d",  # right double quote
        "\u00e2\u20ac\u2122": "\u2019",  # apostrophe
        "\u00c2\u00b7": "\u00b7",  # middle dot
        "2\u00c3\u20142": "2\u00d72",  # 2x2
    }
    for old, new in replacements.items():
        text = text.replace(old, new)

    # Double-mojibake left arrow before link labels
    text = re.sub(
        r"\u00e2\u2020[\u0080-\u00bf]?\u0090?\s*(?=EAC home)",
        ARROW + " ",
        text,
    )
    text = re.sub(
        r"\u00e2\u2020[\u0080-\u00bf]?\u0090?\s*(?=Attendance admin)",
        ARROW + " ",
        text,
    )
    text = re.sub(
        r"\u00e2\u2020[\u0080-\u00bf]?\u0090?\s*(?=Back to list)",
        ARROW + " ",
        text,
    )
    text = re.sub(
        r">\s*\u00e2\u2020[\u0080-\u00bf]?\u0090?\s*",
        ">" + ARROW + " ",
        text,
        count=0,
    )

    # HR arrow in prose (HR → Departments)
    text = text.replace("HR \u00e2\u2020\u2019", "HR \u2192")
    text = text.replace("HR \u00e2\u2020'", "HR \u2192")

    # Sort dropdown en-dash
    text = text.replace("A\u00e2\u20ac\u201cZ", "A\u2013Z")
    text = text.replace("1st\u00e2\u20ac\u201c15th", "1st\u201315th")
    text = text.replace("16th\u00e2\u20ac\u201cEOM", "16th\u2013EOM")
    text = text.replace("high \u00e2\u20ac\u201c low", "high \u2013 low")

    # Table / placeholder dash
    text = text.replace(">\u00e2\u20ac\u201d<", ">\u2014<")

    # Emoji buttons -> Font Awesome
    text = re.sub(
        r"[^\x00-\x7F]{2,8}\s*View Full DTR",
        '<i class="fas fa-file-lines me-1" aria-hidden="true"></i>View Full DTR',
        text,
    )

    return text


def main() -> None:
    changed = 0
    for path in sorted(ROOT.rglob("*.html")):
        raw = path.read_text(encoding="utf-8")
        text = fix_content(try_repair_mojibake(raw))
        if text != raw:
            path.write_text(text, encoding="utf-8", newline="\n")
            changed += 1
            print(path.relative_to(ROOT))
    print(f"Updated {changed} file(s).")


if __name__ == "__main__":
    main()
