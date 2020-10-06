#!/bin/bash

# Check if running as root and exit if not
if [[ $EUID -ne 0 ]]
then
  echo "This script must be run as root.."
  exit 1
fi

# Functions
# Announce says what's happening and hides output
function announce {
        >&2 echo -n "$1"
}

# Check_fail checks status of command and exits if it fails
function check_fail {
        if [[ $1 -ne 0 ]]; then
                >&2 echo "FAIL!"
                exit 1
        else
                >&2 echo "OK!"
        fi
}

SCRIPT="clear-ltechagent-state"
SERVICE="$SCRIPT.service"
TIMER="$SCRIPT.timer"
BINDIR="/usr/local/bin"
SYSTEMDDIR="/etc/systemd/system"

announce "Copying script to bin directory.."
cp $SCRIPT $BINDIR
check_fail $?

announce "Setting permissions on script.."
check_fail $?

announce "Setting permissions on script.."
chmod +x $BINDIR/$SCRIPT
check_fail $?

announce "Copying systemd files.."
cp $SCRIPT.* $SYSTEMDDIR
check_fail $?

announce "Reload systemd daemon.."
systemctl daemon-reload
check_fail $?

announce "Enable timer.."
systemctl enable --now $TIMER
check_fail $?

announce "Setting permissions on script"
chmod +x $BINDIR/$SCRIPT
check_fail $?

announce "Copying systemd files.."
cp $SCRIPT.* $SYSTEMDDIR
check_fail $?

announce "Reload systemd daemon.."
systemctl daemon-reload
check_fail $?

announce "Enable timer.."
systemctl enable --now $TIMER
check_fail $?

echo "Install Complete."
