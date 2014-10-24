@echo off

rem Get the update from teh remote repository
git pull

rem Copy vimrc
copy ..\etc\_vimrc %userprofile%

rem Copy bashrc
copy ..\etc\bashrc %userprofile%\.bashrc

rem Import the Putty settings
reg import ..\etc\putty_settings.reg

