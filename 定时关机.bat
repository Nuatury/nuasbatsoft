@ECHO off

TITLE Shutdown countdown

COLOR f2

:start 

CLS

echo ---tag--- Input minute to shutdown --or-- 0 to cancel

SET /p time_s=---Enter the minute number:

ECHO %time_s%|FINDSTR  /BE "[0-9]*" > NUL || GOTO start

IF %time_s% EQU 0 GOTO clstime

IF %time_s% GEQ 1 GOTO settime

:clstime 

shutdown.exe -a
GOTO start

:settime 
set /a res = %time_s%*60
shutdown.exe -s -t %res%
ECHO success
PAUSE

:exitcmd 

exit