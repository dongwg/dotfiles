@echo off

if "%~1" == "" goto USAGE

if "%1" == "vimrc" goto VIMRC

if "%1" == "bashrc" goto BASHRC

if "%1" == "putty" goto PUTTY

if "%1" == "all" goto ALL


:ERROR
echo Unknown command line argument "%1"
goto END

:VIMRC
rem Copy vimrc
echo copy "%userprofile%\_vimrc" "%~dp1etc\_vimrc"
copy "%userprofile%\_vimrc" "%~dp1etc\_vimrc"
goto END

:BASHRC
rem Copy bashrc
echo copy "%userprofile%\.bashrc" "%~dp1etc\bashrc"
copy "%userprofile%\.bashrc" "%~dp1etc\bashrc"
goto :END

:PUTTY
rem PuTTY settings
echo reg export HKCU\Software\SimonTatham "%~dp1etc\putty_settings.reg"
reg export HKCU\Software\SimonTatham "%~dp1etc\putty_settings.reg"
goto END

:ALL
rem Copy vimrc
echo copy "%userprofile%\_vimrc" "%~dp1etc\_vimrc"
copy "%userprofile%\_vimrc" "%~dp1etc\_vimrc"
rem Copy bashrc
echo copy "%userprofile%\.bashrc" "%~dp1etc\bashrc"
copy "%userprofile%\.bashrc" "%~dp1etc\bashrc"
rem PuTTY settings
echo reg export HKCU\Software\SimonTatham "%~dp1etc\putty_settings.reg"
reg export HKCU\Software\SimonTatham "%~dp1etc\putty_settings.reg"
goto END

:USAGE
echo wd_backup.cmd: backup working copies of configures to dotfiles
echo usage: wd_backup.cmd arg
echo        If arg is blank, it displays this usage.
echo        The expected values of arg are
echo        vimrc - to backup the working copy of _vimrc (in HOME)
echo        bashrc - to backup the working copy of .bashrc
echo        putty - to backup putty settings to ..\etc\putty_settings.reg
echo        all - to backup all of the above
goto END

:END
rem End of the file
