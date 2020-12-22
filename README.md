# Fix ConnectWise Automate (formerly LabTech) Service in Linux

Scenario:
Automate may report a Linux server/workstation offline, and restarting the
  service may not address the issue. You may find in
  `/usr/local/ltechagent/agent.log` an error message stating one of the
  following:

    <error> 12/06/2020 13:13:13 (agent.c:635) Failed to unencrypt LabTech agent password.
    <error> 12/06/2020 13:13:13 (agent.c:490) Failed to read state file /usr/local/ltechagent/state. Trying to read the backup.
    <error> 12/06/2020 13:13:13 (agent.c:495) Failed to read old state file /usr/local/ltechagent/state_old

Removing the state files in `/usr/local/ltechagent/` and restarting the
  service will typically address it. This script will check the `tail` end of the
  `agent.log` and see if the error message is there. If so, it will restart
  the agent and delete the state files. You can also run this on a schedule.

Getting Started
---------------

### Install
To install as a systemd timer (five minutes after boot and hourly afterwards),
 use **setup.sh**:

    sudo ./setup.sh

### Running manually (no timer)
If you rather just run this manually:

    sudo ./clear-ltechagent-state

There may be other reasons as to why the agent is running. This is only meant
  to address the scenario listed above. These scripts are not provided by
  ConnectWise/Automate/LabTech. Use at your own risk.


THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
  APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
  HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
  OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
  IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
  ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
