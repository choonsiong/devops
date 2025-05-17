#!/usr/bin/env python3

import re
from datetime import datetime

def us_to_iso_dates(text):
    # Pattern matches MM/DD/YYYY or MM-DD-YYYY
    # \b ensures we match whole words (word boundary marker)
    pattern = r"\b(0?[1-9]|1[0-2])[/-](0?[1-9]|[12][0-9]|3[01])[/-](\d{4})\b"
    def replacer(match):
        month, day, year = match.groups()
        try:
            dt = datetime(int(year), int(month), int(day))
            return dt.strftime('%Y-%m-%d')
        except ValueError:
            return match.group(0)  # Return original if invalid date
    return re.sub(pattern, replacer, text)

def usToISODates(text):
    # Pattern matches MM/DD/YYYY or MM-DD-YYYY
    pattern = r"\b(0?[1-9]|1[0-2])[/-](0?[1-9]|[12][0-9]|3[01])[/-](\d{4})\b"
    def replacer(match):
        month, day, year = match.groups()
        try:
            dt = datetime(int(year), int(month), int(day))
            return dt.strftime('%Y-%m-%d')
        except ValueError:
            return match.group(0)  # Return original if invalid date
    return re.sub(pattern, replacer, text)

def convert_us_to_iso_dates(text):
    # Pattern to match MM/DD/YYYY format
    date_pattern = r'\b(\d{1,2})/(\d{1,2})/(\d{4})\b'

    # Function to replace each match
    def replace(match):
        month, day, year = match.groups()
        return f'{year}-{month.zfill(2)}-{day.zfill(2)}'

    # Replace all matches in the text
    return re.sub(date_pattern, replace, text)

if __name__ == "__main__":
    s = input("Enter a string: ")
    print("Converted string:", us_to_iso_dates(s))

