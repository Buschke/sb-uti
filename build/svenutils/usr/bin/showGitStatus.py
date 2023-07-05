#!/usr/bin/env python3

import subprocess
from pathlib import Path
from typing import Iterator, Set, Tuple

def check_git_status(dir):
    output = subprocess.run(['git', '-C', dir, 'status', '--porcelain'], capture_output=True, text=True).stdout
    return {Path(dir, line[3:]): 'Untracked' if line.startswith('??') else 'Uncommitted' for line in output.splitlines() if line}

def find_git_repos(start_dir):
    return {file: status for dir in Path(start_dir).rglob('.git') for file, status in check_git_status(dir.parent).items()}

def main():
    changes = find_git_repos('/home/sven/myDev/DailyChallenge')
    for file, status in changes.items():
        print(f'{status} file: {file}')

if __name__ == '__main__':
    main()