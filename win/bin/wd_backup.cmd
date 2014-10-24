@echo off


rem Copy vimrc
copy %userprofile%\_vimrc ..\etc\_vimrc

rem Copy bashrc
copy %userprofile%\.bashrc ..\etc\bashrc

rem PuTTY settings
reg export HKCU\Software\SimonTatham ..\etc\putty_settings.reg


