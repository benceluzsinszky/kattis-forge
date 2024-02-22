@echo off
setlocal enabledelayedexpansion
set /a counter=1
for %%i in (samples\*.in) do (
    echo Test !counter!
    python main.py < %%i > temp.out
    fc /n temp.out samples\%%~ni.ans > nul
    set /p output=<temp.out
    set /p ans=<samples\%%~ni.ans
    if errorlevel 1 (
        echo Fail ^| Expected: !ans! ^| Output: !output!
    ) else (
        echo Success ^| Expected: !ans! ^| Output: !output!
    )
    set /a counter+=1
)
del temp.out
pause