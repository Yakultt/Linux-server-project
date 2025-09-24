#!/usr/bin/python3
import re

LOG_FILE = "/var/log/syslog"

# Emergency logs often tagged with the emergency priority
emergency_pattern = re.compile(r".*\bemerg\b.*", re.IGNORECASE)

def read_logs():
    try:
        with open(LOG_FILE, "r") as file:
            for line in file:
                if emergency_pattern.search(line):
                    print("[EMERGENCY] " + line.strip())
    except PermissionError:
        print("Permission denied: try running with sudo")
    except FileNotFoundError:
        print(f"Log file {LOG_FILE} not found")

if __name__ == "__main__":
    read_logs()