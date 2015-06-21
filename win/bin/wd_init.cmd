@echo off

setlocal

rem Find the root directory of WIN dotfiles which 
rem is the parent directory of the batch file
for %%i in ("%~dp0..") do set "wroot=%%~fi"

rem get vundle.vim if it doesn't exist
if not exist "%userprofile%\vimfiles\bundle\Vundle.vim" (
  rem cd /d %userprofile%
  git clone "https://github.com/gmarik/Vundle.vim.git" "%userprofile%/vimfiles/bundle/Vundle.vim"
  )

rem Copy vimrc
if not exist "%userprofile%\_vimrc" (
  echo copy "%wroot%\etc\_vimrc" "%userprofile%"
  copy "%wroot%\etc\_vimrc" "%userprofile%"
  )


rem Copy bashrc
if not exist "%userprofile%\.bashrc" (
  echo copy "%wroot%\etc\bashrc" "%userprofile%\.bashrc"
  copy "%wroot%\etc\bashrc" "%userprofile%\.bashrc"
  )

:END
rem The end of the file
