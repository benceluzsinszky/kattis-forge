@echo off
setlocal enabledelayedexpansion
set /a counter=1
for %%i in (samples\*.in) do (
    go run main.go < %%i > temp.out
    fc /n temp.out samples\%%~ni.ans > nul
    if errorlevel 1 (
        echo Test !counter!: [91mFAIL^^![0m
    ) else (
        echo Test !counter!: [92mSUCCESS^^![0m
    )

    echo.
    echo [94mExpected output[0m -^> Actual output
    echo.

    set /a ansCounter=0
    for /f "delims=" %%a in (samples\%%~ni.ans) do (
        set /a ansCounter+=1
        set "ansLine[!ansCounter!]=%%a"
    )
    set /a outCounter=0
    for /f "delims=" %%a in (temp.out) do (
        set /a outCounter+=1
        set "outLine[!outCounter!]=%%a"
    )
    for /l %%x in (1, 1, !ansCounter!) do (
        if "!ansLine[%%x]!"=="!outLine[%%x]!" (
            echo [94m!ansLine[%%x]![0m == !outLine[%%x]!
        ) else (
            echo --------------------------------------
            echo [91m!ansLine[%%x]! =\= !outLine[%%x]![0m
            echo --------------------------------------
        )
    )
    set /a counter+=1
    echo.
    echo ######################################
)
del temp.out
pause