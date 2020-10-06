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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
check_fail $?

announce "Setting permissions on script.."
<<<<<<< HEAD
=======
check_fail $?

announce "Setting permissions on script.."
>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
=======
check $?
=======
check_fail $?
>>>>>>> 0d901bd... Initial Version

announce "Setting permissions on script"
=======
>>>>>>> e7c1447... Initial Version
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
<<<<<<< HEAD
check $?
>>>>>>> 98b3402... Initial Version
=======
check_fail $?
>>>>>>> 0d901bd... Initial Version
=======
>>>>>>> refs/remotes/origin/main

echo "Install Complete."
