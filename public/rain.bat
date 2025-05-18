@echo off
color 0A
title cmd rain
setlocal EnableDelayedExpansion

:: Get terminal width
for /f "tokens=2 delims=:" %%a in ('mode con ^| findstr "Columns"') do set "COLS=%%a"
set /a COLS=COLS - 1

:LOOP
set "line="
set /a angle=%random% %% 3
if %angle%==0 (set "char=|")
if %angle%==1 (set "char=/")
if %angle%==2 (set "char=\\")

set /a pos=0
:inner_loop
if !pos! lss %COLS% (
    set /a space=%random% %% 8 + 1
    for /l %%i in (1,1,!space!) do (
        set "line=!line! "
        set /a pos+=1
        if !pos! geq %COLS% goto print_line
    )
    set "line=!line!!char!"
    set /a pos+=1
    goto inner_loop
)

:print_line
echo(!line!
ping -n 1 -w 100 127.0.0.1 >nul
goto LOOP
