@echo off

IF "%MT4_HOME%"=="" (
  echo "Set MT4_HOME environment variable to point to MT4 installation folder"
  exit
)

set METAEDITOR="%MT4_HOME%\metaeditor.exe"
set METAINCLUDE="%MT4_HOME%\MQL4"
set "LOGFILE=%~dpn1.log"

:: Compile
%METAEDITOR% /compile:%1 /log /include:%METAINCLUDE%
:: 0 = failed
:: 1 = everything good

IF /I "%ERRORLEVEL%" EQU "0" (
  type "%LOGFILE%"
  erase "%LOGFILE%"    
)

