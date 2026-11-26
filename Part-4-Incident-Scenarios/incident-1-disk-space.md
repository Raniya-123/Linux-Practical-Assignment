


1. Symptom

The production server reported 95% disk utilisation, preventing users from uploading files.

### 2. Investigation

**Filesystem usage:**

Used `df -h` to check filesystem usage and identify the affected mount point.

In my lab environment, the main filesystem `/` showed 35% usage, with 4.4 GB available. This was different from the reported production incident of 95%.

**Directory investigation:**

Used `sudo du -sh /* 2>/dev/null` to identify directories consuming the most space.

The largest directories were:
- `/usr` – 1.8 GB
- `/snap` – 567 MB
- `/var` – 543 MB

**Large file investigation:**

Used `sudo find / -type f -size +500M 2>/dev/null` to search for files larger than 500 MB.

The search identified `/proc/kcore`, which is a virtual kernel file and does not represent a normal file occupying that amount of disk space.

**Old log investigation:**

Used `sudo find /var/log -type f -mtime +30 -ls` to identify log files older than 30 days.

No log files older than 30 days were found.

### 3. Action and Safe Remediation

To simulate disk usage, I created a 100 MB temporary file using `fallocate`.

After the test, I removed the temporary file using `rm`.

No system files or production logs were deleted.

In a real production environment, I would confirm the following with the application owner before removing or archiving any data:
- Whether the files are still required by the application.
- Whether the logs are needed for troubleshooting or auditing.
- Whether any data retention requirements apply.
- Whether a backup is required before removal.

Old logs could be safely archived or removed only after these checks and approval.

### 4. Verification

Used `df -h` to check disk usage before and after the simulated cleanup.

Before cleanup, `/tmp` showed 100 MB used and 23% utilisation.

After removing the temporary file, `/tmp` returned to 0% usage, confirming that the temporary file had been removed and its space released.

### 5. Commands Used

- `df -h` – Check filesystem usage.
- `sudo du -sh /* 2>/dev/null` – Identify directory sizes.
- `sudo find / -type f -size +500M 2>/dev/null` – Find large files.
- `sudo find /var/log -type f -mtime +30 -ls` – Identify old log files.
- `fallocate -l 100M /tmp/test_disk_file` – Create a temporary test file.
- `rm /tmp/test_disk_file` – Remove the temporary test file.

