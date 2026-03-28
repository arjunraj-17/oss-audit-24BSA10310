#!/bin/bash

# 1. Variables and Command Substitution for System Info
distro=$(lsb_release -ds)
kernel=$(uname -r)
current_user=$USER
home_dir=$HOME
uptime_info=$(uptime -p)
current_date=$(date "+%Y-%m-%d %H:%M:%S")

# 2. Formatting using Echo and Escape Characters
echo "========================================================"
echo "          OSS AUDIT PROJECT - WELCOME SCREEN           "
echo "========================================================"
echo "DATE/TIME: $current_date"
echo "SYSTEM UPTIME: $uptime_info"
echo ""

# 3. Displaying User and Distribution Data
echo "AUDITOR IDENTITY:"
echo "  Logged-in User : $current_user"
echo "  Home Directory : $home_dir"
echo ""

echo "OS SPECIFICATIONS:"
echo "  Distribution   : $distro"
echo "  Kernel Version : $kernel"
echo ""

# 4. License Information (Philosophy Check)
echo "LEGAL NOTICE:"
echo "  This operating system is covered by the GNU General"
echo "  Public License (GPL). You are free to study, modify,"
echo "  and redistribute this software under the terms of"
echo "  the Free Software Foundation."
echo "========================================================"
