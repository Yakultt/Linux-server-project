#!/usr/bin/python3
import socket
from datetime import datetime

#identifying the common services
COMMON_SERVICES = {
    22: "SSH",
    80: "HTTP",
    443: "HTTPS",
    3306: "MySQL",
    25: "SMTP",
    53: "DNS",
    21: "FTP",
    23: "Telnet"
}

def scan_port(target, port):
    """Trying to connect to a port and return if it's open or closed."""
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        result = sock.connect_ex((target, port))
        sock.close()
        return result == 0
    except Exception:
        return False

def main():
    target = input("Enter target host (IP or domain): ")
    port_range = input("Enter port range: ")
    start_port, end_port = map(int, port_range.split("-"))

    print(f"\nScanning {target} from port {start_port} to {end_port}...")

    for port in range(start_port, end_port + 1):
        if scan_port(target, port):
            service = COMMON_SERVICES.get(port, "Unknown")
            print(f"[+] Port {port} OPEN ({service})")

    with open("scan_results.log", "a") as log:
        log.write(f"Scan of {target}\n")
        for port in range(start_port, end_port + 1):
            if scan_port(target, port):
                service = COMMON_SERVICES.get(port, "Unknown")
                log.write(f"Port {port} OPEN ({service})\n")
        log.write("\n")


if __name__ == "__main__":
    main()
