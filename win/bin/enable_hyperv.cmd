@echo off
echo Turning ON Hyper-V services
pause
bcdedit /set hypervisorlaunchtype auto
echo Modified the BootFile, please reboot...
pause
