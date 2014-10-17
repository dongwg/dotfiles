@echo off

rem get vundle.vim if it doesn't exist
if not exist %userprofile%\vimfiles\bundle\Vundle.vim (
  rem cd /d %userprofile%
  git clone "https://github.com/gmarik/Vundle.vim.git" "%userprofile%/vimfiles/bundle/Vundle.vim"
  )

rem Copy vimrc
copy ..\etc\_vimrc %userprofile%

rem Copy bashrc
copy ..\etc\bashrc %userprofile%\.bashrc


