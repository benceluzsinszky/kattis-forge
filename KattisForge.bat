@echo off
setlocal enabledelayedexpansion

:: Read output_path from config.ini
for /f "tokens=1,2* delims==" %%a in ('type .\config.ini') do (
    if /i "%%a"=="output_path" set output_path=%%b
)

:: If output_path is empty, prompt for a new one
if "!output_path!"=="" (
    :promptPath
    set /p output_path="Enter output path (or press enter for C:\Users\{username}\Documents\Kattis): "
    if "!output_path!"=="" (
        set output_path=C:\Users\%username%\Documents\Kattis
    )
    :: Write output_path to config.ini
    echo [DEFAULT] > .\config.ini
    echo output_path=!output_path! >> .\config.ini
)

:: Trim trailing spaces from output_path
for /f "tokens=1* delims= " %%a in ("!output_path!") do set output_path=%%a

:: Prompt for problem name
set /p problem_name="Name of Kattis problem: "

:: Prompt for setup language
:promptLanguage
set /p language="Python or Java for the setup (J/P)? "
if /i "!language!"=="J" (
    set language=Java
) else if /i "!language!"=="java" (
    set language=Java
) else if /i "!language!"=="P" (
    set language=Python
) else if /i "!language!"=="python" (
    set language=Python
) else (
    echo Invalid input, please try again.
    goto promptLanguage
)

:: Create problem and samples directories
mkdir "!output_path!\!problem_name!" >nul 2>&1
mkdir "!output_path!\!problem_name!\samples" >nul 2>&1

:: Copy scripts based on input
if "!language!"=="Python" (
    robocopy .\scripts "!output_path!\!problem_name!" main.py /xo >nul
    copy /y .\scripts\answerchecker_python.bat "!output_path!\!problem_name!\answerchecker.bat" >nul
) else (
    robocopy .\scripts "!output_path!\!problem_name!" Main.java /xo >nul
    copy /y .\scripts\answerchecker_java.bat "!output_path!\!problem_name!\answerchecker.bat" >nul
)

start "" "!output_path!\!problem_name!"