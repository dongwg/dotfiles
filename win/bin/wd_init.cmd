@echo off

rem get vundle.vim if it doesn't exist
if not exist %userprofile%\vimfiles\bundle\Vundle.vim (
  rem cd /d %userprofile%
  git clone "https://github.com/gmarik/Vundle.vim.git" "%userprofile%/vimfiles/bundle/Vundle.vim"
  )

rem Copy vimrc
echo copy "%~dp1etc\_vimrc" "%userprofile%"
copy "%~dp1etc\_vimrc" "%userprofile%"


rem Copy bashrc
echo copy "%~dp1etc\bashrc" "%userprofile%\.bashrc"
copy "%~dp1etc\bashrc" "%userprofile%\.bashrc"

:END
rem The end of the file
