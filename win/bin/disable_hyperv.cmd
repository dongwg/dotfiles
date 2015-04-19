@echo off
echo Turning off Hyper-V services
pause
bcdedit /set hypervisorlaunchtype off
echo Modified the BootFile, please reboot...
pause
