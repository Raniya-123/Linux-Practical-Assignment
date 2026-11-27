 

Incident 2: Application Login Failure 

Symptoms 

The application experienced login failures. The application log contained multiple ERROR messages related to database connectivity and authentication. 

 

Investigation 

28: Extract and Count All ERROR Messages 

Used the following commands to display and count the ERROR messages in the application log: 

grep "ERROR" application.log 
grep -c "ERROR" application.log 

The commands displayed all ERROR messages and counted the total number of errors. 

 

29: Extract Timestamps and Error Messages 

Used awk to extract the timestamps and corresponding error messages from log entries containing ERROR. 

This helped identify when each error occurred and what the error was. 

 

30: Identify the First and Last Error Entries 

Used the following commands: 

grep "ERROR" application.log | head -n 1 
grep "ERROR" application.log | tail -n 1 

The findings were: 

First error: 10:03:20 – Invalid database credentials. 

Last error: 10:10:40 – Database connection refused. 

Other errors included connection timeout and connection pool exhaustion. 

 

31: Create a Separate Report Replacing ERROR with CRITICAL 

Used the sed command to replace ERROR with CRITICAL and save the modified entries into a separate report file. 

sed 's/ERROR/CRITICAL/g' application.log > critical_report.log 

This preserved the original application log. The separate report displayed all five errors as CRITICAL. 

 

32: Create an Alert When the Error Count Is Greater Than 3 

Created and executed a shell script to count the ERROR entries in the log file. 

The script checks whether the error count is greater than 3. Since the log contained 5 errors, it correctly displayed: 

WARNING: Too many errors detected 

This confirmed that the alert condition was working correctly. 

Findings 

The investigation identified the following: 

A total of 5 ERROR entries were found. 

The first error was related to invalid database credentials. 

The last error showed that the database connection was refused. 

Other errors included connection timeouts and connection pool exhaustion. 

The alert script successfully detected that the error count exceeded 3. 

Further Investigation 

The following checks could help identify the actual root cause: 

Check database server status: Verify whether the database server is running and accepting connections. 

Verify database credentials: Check whether the application is using the correct database username, password and authentication settings. 

Check network connectivity: Test whether the application server can connect to the database server using the correct IP address and port. 

Investigate connection pool settings: Check whether the maximum number of database connections has been reached. 

 

Conclusion 

The application log contained five ERROR entries, including invalid database credentials, connection timeouts and a database connection refusal. 

These errors suggest possible database connectivity or configuration issues. However, the log alone does not prove that the database server is down. 

Further investigation of the database server, credentials, network connectivity and connection pool settings is required to confirm the actual root cause. 

 
