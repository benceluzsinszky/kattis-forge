@echo off
setlocal enabledelayedexpansion
javac Main.java
for %%i in (samples\*.in) do (
    java Main < %%i > temp.out
    fc /n temp.out samples\%%~ni.ans > nul
    set /p output=<temp.out
    set /p ans=<samples\%%~ni.ans
    if errorlevel 1 (
        echo Fail !output! !ans!
    ) else (
        echo Success !output! !ans!
    )
)

del temp.out
pause