# 🧩 AllStaff Auto Update

![PowerShell](https://img.shields.io/badge/Language-PowerShell-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![License](https://img.shields.io/badge/License-All%20Rights%20Reserved-red)

A PowerShell automation script designed to streamline the process of performing system-wide updates for AllStaff environments.

---

## 📦 Overview

The **AllStaff Auto Update** script automates the process of checking, downloading, and applying updates across multiple Windows systems or shared environments.  
It ensures consistent patching, logging, and version control across your organization's machines.

This tool is ideal for IT administrators who need to keep all staff computers synchronized and up to date without manual intervention.

---

## 🧰 Features

- 🔄 Automated Windows updates and software version checks  
- 📋 Centralized logging of update results  
- 🧠 Smart retry logic for failed updates  
- ⚙️ Optional parameters for silent or interactive modes  
- 🔐 Runs with administrative permissions when required  

---

## 🗂️ Project Structure

```
allstaff-auto-update/
└── auto-update-script.ps1     # Main PowerShell script
```

---

## ⚙️ Usage

### 1️⃣ Prerequisites
- Windows 10 or later  
- PowerShell 5.1+ (recommended)  
- Administrative privileges (if updating protected software)

### 2️⃣ Run the Script
Open **PowerShell as Administrator** and execute:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
.uto-update-script.ps1
```

If your script resides in a subfolder, navigate to it first:

```powershell
cd allstaff-auto-update
.uto-update-script.ps1
```

---

## 🧩 Parameters

If your script includes parameters (example):

| Parameter | Description | Example |
|------------|-------------|----------|
| `-Silent` | Runs updates without prompts | `.uto-update-script.ps1 -Silent` |
| `-LogPath` | Specifies custom log file location | `.uto-update-script.ps1 -LogPath "C:\Logs\AllStaffUpdate.log"` |

*(Update this table if your script supports other parameters.)*

---

## 🧾 Logging

The script can be configured to log results to:
```
C:\ProgramData\AllStaff\Logs\update-log.txt
```
or a user-defined path via `-LogPath`.

---

## 🧑‍💻 Contributing

This repository is closed-source and not accepting external contributions.  
However, forks may be created for personal or internal organizational use.

---

## 🪪 License

**All Rights Reserved © 2025 Nelson Chicas**

The PowerShell source code in this repository is proprietary and may not be redistributed, modified, or used commercially without written consent.

---

## 📸 Example (Optional)

If you plan to show command output or GUI interaction, include an example screenshot here:

```markdown
![Script Output Example](assets/screenshots/update-run-example.png)
```

---

*Developed to simplify routine maintenance and ensure consistency across AllStaff systems.*
