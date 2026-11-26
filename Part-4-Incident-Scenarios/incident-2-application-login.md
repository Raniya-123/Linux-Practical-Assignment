
## Incident 2: Application Login Failure

### 28. Extract all ERROR messages and count them

Used `grep "ERROR" application.log` to display all ERROR messages from the application log.

Used `grep -c "ERROR" application.log` to count the total number of errors.

The total number of ERROR entries found was **5**.

### 29. Extract timestamps and error messages only

Used `awk` to extract the timestamps and corresponding error messages from the log entries containing ERROR.

This helped identify the time and details of each error.

### 30. Identify the first and last error entries

Used `grep "ERROR" application.log | head -n 1` to identify the first error entry.

Used `grep "ERROR" application.log | tail -n 1` to identify the last error entry.

The findings were:

- First error: 10:03:20 – Invalid database credentials.
- Last error: 10:10:40 – Database connection refused.

Other errors included connection timeout and connection pool exhaustion.

### 31. Create a separate report replacing ERROR with CRITICAL

Used the `sed` command to replace ERROR with CRITICAL and saved the modified entries into a separate report file.

Command used:

`sed 's/ERROR/CRITICAL/g' application.log > critical_report.log`

This preserved the original application log.

The separate critical report displayed all five errors as CRITICAL.

### 32. Write or adapt a script that alerts when the error count is greater than 3

Created and executed a shell script to count ERROR entries in the log file.

The script checks whether the error count is greater than 3.

Since the log contained 5 errors, the script correctly displayed:

`WARNING: Too many errors detected`

This confirmed that the alert condition was working correctly.

### 33. List further investigations to identify the root cause

The following investigations could help identify the root cause:

1. **Check database server status:** Verify whether the database server is running and accepting connections.

2. **Verify database credentials:** Check whether the application is using the correct database username, password and authentication settings.

3. **Check network connectivity:** Test whether the application server can connect to the database server using the correct IP address and port.

4. **Investigate connection pool settings:** Check whether the maximum number of database connections has been reached.

### Conclusion

The application log contained five ERROR entries, including invalid database credentials, connection timeouts and a database connection refusal.

These errors suggest possible database connectivity or configuration issues. However, the log alone does not prove that the database server is down.

Further investigation of the database server, credentials, network connectivity and connection pool settings is required to confirm the actual root cause.
