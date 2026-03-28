#!/bin/bash

# 1. Define a list of important system directories to audit
# We include /bin (binaries), /etc (configs), and /home (user data)
DIRECTORIES="/bin /etc /home /var/log"

echo "----------------------------------------------------------"
echo "           SYSTEM DIRECTORY RESOURCE AUDIT                "
echo "----------------------------------------------------------"
echo -e "DIRECTORY\tSPACE\tOWNER\tPERMISSIONS"
echo "----------------------------------------------------------"

# 2. Start the for loop to iterate through the list
for DIR in $DIRECTORIES; do
    
    # 3. Check if the directory exists before auditing
    if [ -d "$DIR" ]; then
        
        # 4. Extract Space Usage using 'du' (disk usage)
        # We use -sh for summary/human-readable and awk to get the first field
        usage=$(du -sh "$DIR" 2>/dev/null | awk '{print $1}')
        
        # 5. Extract Owner and Permissions using 'ls -ld'
        # Field 1 is permissions, Field 3 is owner
        perms=$(ls -ld "$DIR" | awk '{print $1}')
        owner=$(ls -ld "$DIR" | awk '{print $3}')
        
        # 6. Report the findings in a formatted row
        echo -e "$DIR\t$usage\t$owner\t$perms"
    else
        echo -e "$DIR\t[MISSING]\t--\t--"
    fi
done

echo "----------------------------------------------------------"
