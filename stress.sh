#!/usr/bin/bash

# Variables section begin

PATH_TO_MISP="/var/www/MISP"
if [ ! -d ${PATH_TO_MISP} ]; then
  echo "This script expects MISP to be installed in ${PATH_TO_MISP}, it does not exist, bye."
  exit 126
fi

# This makes use of the standard variables used by the installer
echo "Fetching MISP globalVariables"
eval "$(cat /var/www/MISP/docs/generic/globalVariables.md | grep -v \`\`\`)"
MISPvars > /dev/null 2>&1

if [ $(jq --version > /dev/null 2>&1; echo $?) == 127 ]; then
  echo "jq not found, please install: sudo apt install jq"
  exit 127
fi

if [ $(dialog > /dev/null 2>&1; echo $?) == 0 ]; then
  DIALOG=1
fi

if [ "$(cat $PATH_TO_MISP/VERSION.json |jq -r .hotfix)" -le "108" ]; then
  echo "You need at least MISP v2.4.109 for this to work properly"
  exit 1
fi

# Include the lovely supportFunctions that are the base of MISP installer
echo "Fetching MISP supportFunctions"
eval "$(cat $PATH_TO_MISP/docs/generic/supportFunctions.md | grep -v \`\`\`)"

# Variables section end

# Main section begin
cd /tmp
git clone https://github.com/SteveClement/misp-stress.git
echo "Run the stress.py suite now!"
# Main section end
