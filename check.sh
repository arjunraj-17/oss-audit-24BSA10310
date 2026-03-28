#!/bin/bash

# 1. Define the package to search for
TARGET="git"

echo "--------------------------------------------------------"
echo "        OSS AUDIT: PACKAGE VERIFICATION MODULE          "
echo "--------------------------------------------------------"

# 2. Use dpkg and grep to check if the software is installed
# (dpkg -l lists packages, grep searches for the specific one)
if dpkg -l | grep -q "^ii  $TARGET "; then
    
    # 3. If installed, extract the version number
    VERSION=$(git --version | awk '{print $3}')
    echo "[STATUS]: $TARGET is INSTALLED on this system."
    echo "[VERSION]: $VERSION"
    echo ""

    # 4. Case statement to print description based on package name
    case $TARGET in
        "git")
            echo "DESCRIPTION: Distributed version control system."
            echo "PURPOSE: Tracking changes in source code during software development."
            ;;
        "svn"|"subversion")
            echo "DESCRIPTION: Centralized version control system."
            echo "PURPOSE: Historical alternative to Git (Legacy)."
            ;;
        *)
            echo "DESCRIPTION: Unknown Open Source Tool."
            ;;
    esac

else
    # 5. Else block if the package is missing
    echo "[ERROR]: $TARGET is NOT installed."
    echo "Please run 'sudo apt install $TARGET' to continue the audit."
fi

echo "--------------------------------------------------------"
