@echo off

if "%~1" == "" goto USAGE

if "%1" == "vimrc" goto VIMRC

if "%1" == "bashrc" goto BASHRC

if "%1" == "putty" goto PUTTY

if "%1" == "all" goto all


:ERROR
echo Unknown command line argument "%1"
goto END

:VIMRC
rem Copy vimrc
echo copy "%~dp1etc\_vimrc" "%userprofile%"
copy "%~dp1etc\_vimrc" "%userprofile%"
goto :END

:BASHRC
rem Copy bashrc
echo copy "%~dp1etc\bashrc" "%userprofile%\.bashrc"
copy "%~dp1etc\bashrc" "%userprofile%\.bashrc"
goto :END

:PUTTY
rem Import the Putty settings
echo reg import "%~dp1etc\putty_settings.reg"
reg import "%~dp1etc\putty_settings.reg"
goto END

:ALL
rem Copy vimrc
echo copy "%~dp1etc\_vimrc" "%userprofile%"
copy "%~dp1etc\_vimrc" "%userprofile%"
rem Copy bashrc
echo copy "%~dp1etc\bashrc" "%userprofile%\.bashrc"
copy "%~dp1etc\bashrc" "%userprofile%\.bashrc"
rem Import the Putty settings
echo reg import "%~dp1etc\putty_settings.reg"
reg import "%~dp1etc\putty_settings.reg"
goto END

:USAGE
echo wd_update.cmd: update working copies of configures with those in dotfiles
echo usage: wd_update.cmd arg
echo        If arg is blank, it displays this usage.
echo        The expected values of arg are
echo        vimrc - to update the working copy of _vimrc (in HOME)
echo        bashrc - to update the working copy of .bashrc
echo        putty - to import putty settings from ..\etc\putty_settings.reg
echo        all - to update all of the above
goto END

:END
rem End of the file
