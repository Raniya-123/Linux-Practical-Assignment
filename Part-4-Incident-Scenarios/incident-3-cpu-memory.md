Incident 3: High CPU and Memory 

34. Show how you would inspect CPU, memory and system load 
The application server was reported as slow, with CPU usage at 95% and memory usage at 90%. 
I used the following commands to investigate system performance: 
top – Monitor CPU usage, memory usage and running processes. 
free -h – Check total, used and available memory. 
uptime – Check system uptime and load averages. 

35. Identify the processes consuming the most CPU and memory 
Used the following commands to identify processes consuming the highest resources: 
ps aux --sort=-%cpu | head – Display processes sorted by highest CPU usage. 
ps aux --sort=-%mem | head – Display processes sorted by highest memory usage. 

Findings: 
CPU usage was low during the investigation. 
Total memory was 908 MiB, with 560 MiB available. 
System load averages were 0.00, 0.00 and 0.00. 
The fwupd process (PID 2279) had the highest memory usage at 4.3%. 
No process was consuming significant CPU resources. 

36. Explain how to inspect a process by PID 
A Process ID (PID) is a unique number assigned to each running process. 
Used the following command to inspect the selected process: 
ps -p 2279 -f 
This displayed detailed information about the process, including its user, PID, parent PID and command. 
The investigation identified PID 2279 as the fwupd process running under the root user.

38. Explain the difference between kill and kill -9, and when force termination should be avoided 
kill – Sends the SIGTERM signal (15) by default, requesting the process to terminate normally. This allows the process to close files and release resources safely. 
kill -9 – Sends the SIGKILL signal (9), which immediately forces the process to stop without allowing it to perform normal cleanup. 
Force termination should be avoided unless necessary because it may cause data loss, incomplete operations or resource cleanup problems. It is better to try normal termination first and use kill -9 only as a last resort. 

 Action and Verification 
Identified the processes using the most CPU and memory and inspected the selected process using its PID. 
No processes were terminated because force termination was unnecessary. 
Rechecked system performance using top, free -h and uptime. The server showed low CPU usage, sufficient available memory and very low system load. 

Conclusion 
The investigation did not reproduce the reported high CPU and memory usage in the lab environment. The system was operating normally during the checks. 
No process termination was required, and no errors were encountered during the investigation. 

 
