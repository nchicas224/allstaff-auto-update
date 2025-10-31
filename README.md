# 🧩 AllStaff Auto Update

![PowerShell](https://img.shields.io/badge/Language-PowerShell-blue)
![Microsoft 365](https://img.shields.io/badge/Platform-Microsoft%20365-0078D4)
![Automation](https://img.shields.io/badge/Type-Automation-green)
![License](https://img.shields.io/badge/License-All%20Rights%20Reserved-red)

An automated PowerShell solution for Microsoft 365 administrators to keep their **All Staff distribution list** up to date without manual intervention.

---

## 📦 Overview

The **AllStaff Auto Update** script ensures your organization's “All Staff” distribution list always reflects your current, actively licensed employees.

It works by:
- Querying your tenant’s licensed users
- Adding new hires to the All Staff distribution list automatically
- Removing terminated or unlicensed users
- Running on a scheduled interval (e.g., Task Scheduler, Azure Automation, or Function App timer)

This helps organizations maintain accurate communication lists for internal announcements, HR notices, and company-wide messaging.

---

## 🧰 Features

- 🔄 Automatically adds newly licensed users to the All Staff distribution list  
- ❌ Removes users who no longer hold any active Microsoft 365 licenses  
- 🕐 Supports automation via Task Scheduler, Azure Automation, or any timer-based trigger  
- 📋 Generates optional output logs for auditing updates  
- ⚙️ Designed to run unattended once configured  

---

## 🗂️ Project Structure

```
allstaff-auto-update/
└── auto-update-script.ps1     # Main PowerShell automation script
```

---

## ⚙️ Setup & Configuration

### 🧰 Prerequisites

- **PowerShell 5.1+** or **PowerShell 7+**
- **Microsoft Graph PowerShell SDK**
  ```powershell
  Install-Module Microsoft.Graph -Scope AllUsers
  ```
- Sufficient permissions to read user objects and manage distribution lists (typically part of the M365 admin team).

---

## 🚀 Running the Script

Run the script locally or through any automation platform that supports PowerShell:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
.uto-update-script.ps1
```

### 🕐 Schedule It (Recommended)

#### ⏰ Windows Task Scheduler
1. Open Task Scheduler → *Create Basic Task*  
2. Set your desired interval (e.g., daily at 3 AM)  
3. Action → *Start a program*  
   ```
   powershell.exe -File "C:\Scripts\auto-update-script.ps1"
   ```

#### ☁️ Azure Automation
- Create a PowerShell Runbook  
- Upload the script  
- Link it to a **Timer Trigger** (e.g., every 24 hours)

---

## 🧾 Logging (Optional)

You can configure the script to write logs to:
```
C:\ProgramData\AllStaff\Logs\sync-log.txt
```
Each run can record:
- Added users
- Removed users
- Total users synced
- Timestamps and success/failure status

---

## ⚠️ Notes

- This script only targets **static distribution lists**. It does **not** modify dynamic groups.  
- All changes occur using standard Microsoft Graph user and group management APIs.  
- You can safely re-run the script — it performs **idempotent** updates (only changes necessary members).

---

## 🧑‍💻 Contributing

This project is closed-source and not accepting public contributions.  
Forks may be used for personal or internal administrative automation.

---

## 🪪 License

**All Rights Reserved © 2025 Nelson Chicas**

The PowerShell source code in this repository is proprietary and may not be redistributed, modified, or used commercially without written permission.

---

*Developed for Microsoft 365 administrators to maintain accurate All Staff distribution lists automatically.*
