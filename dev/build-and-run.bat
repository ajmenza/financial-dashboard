@echo off
setlocal enabledelayedexpansion

REM Usage Instructions
if "%1"=="" goto start
if "%1"=="clean" goto clean
goto usage

:usage
echo Usage: build-and-run.bat [clean]
echo   clean - Stop and remove containers, volumes, and networks before building
exit /b 1

:clean
REM Clean the environment
call dev\run.bat clean
goto start

:start
REM Navigate to the root directory
cd ..

REM Build the Spring Boot application
echo Building Spring Boot application...
call mvn clean package -DskipTests
if errorlevel 1 (
    echo Build failed. Exiting.
    exit /b 1
)

REM Navigate back to the dev directory and run the application
cd dev
echo Running the application...
call run.bat start
