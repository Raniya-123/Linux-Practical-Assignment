Incident 4: Permission Denied 

38. Inspect the file's permissions and ownership

The developer received a Permission denied error when trying to execute a deployment script. 

Since the original deployment script was not available in my lab, I created a practice file using: 

touch deployment.sh 

Used the following command to inspect its permissions and ownership: 

ls -l deployment.sh 

Initially, the owner and group had read and write permissions but no execute permission. This explained why the script could not be executed directly. 

39. The permission rwxr-xr-x represents the following: 

Owner (rwx): Has read, write and execute permissions. 

Group (r-x): Has read and execute permissions but no write permission. 

Others (r-x): Have read and execute permissions but no write permission. 

40.Used the following commands to grant execute permission to the owner and group: 

chmod u+x deployment.sh 

This adds execute permission for the owner. 

chmod g+x deployment.sh 

This adds execute permission for the group. 

These commands do not grant write permission to others, so the file is not made world writable. 

41.Difference between chmod and chown 

chmod: Changes file or directory permissions, such as read, write and execute permissions. 

chown: Changes the ownership of a file or directory, including its owner and group. 

chmod u+x deployment.sh 

Adds execute permission for the owner. 

sudo chown ubuntu:ubuntu deployment.sh 

Changes the owner and group to ubuntu. 

42. Verify the change and explain what you would check if execution still fails 

Used the following command to verify the updated permissions: 

ls -l deployment.sh 

The updated permissions were: 

-rwxrwxr-- 

This confirmed that the owner and group had read, write and execute permissions, while others had read-only permission. 

Executed the script using: 

./deployment.sh 

The practice script executed successfully. 

Also used: 

head -n 1 deployment.sh 

This confirmed that the Bash shebang was present: 

#!/bin/bash 

If execution still failed, I would check: 

Whether the file has the correct execute permissions. 

Whether the user has permission to access the file and its parent directories. 

Whether the shebang points to a valid interpreter. 

Whether the script has incorrect line endings. 

Whether the filesystem is mounted with the noexec option. 

Conclusion 

The permission issue was resolved by granting execute permission to the owner and group using chmod. 

The updated permissions were verified, and the practice script executed successfully. No write permission was granted to others. 
