# Fix ConnectWise Automate Service in Linux

Scenario:
Automate may report a Linux box offline, and restarting the service may not
  address the issue. You may find in **/usr/local/ltechagent/agent.log**
  an error message stating **Failed to unencrypt LabTech agent password.**
  Removing the state files in **/usr/local/ltechagent/** and restarting the
  service will typically address it. This script will check the end of the
  **agent.log** and see if the error message is there. If so, it will restart
  the agent and clear the state files. You can also run this on a schedule.

Getting Started
---------------

### Install
To install as a systemd timer (hourly basis), use **setup.sh**:

    sudo setup.sh

### Running manually (no timer)
If you rather just run this manually:

    sudo bash clear-ltechagent-state


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
