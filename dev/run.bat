@echo off
setlocal enabledelayedexpansion

REM Usage Instructions
if "%1"=="" goto start
if "%1"=="start" goto start
if "%1"=="stop" goto stop
if "%1"=="clean" goto clean
goto usage

:usage
echo Usage: run.bat [start|stop|clean]
echo   start - Start the development environment with the current build
echo   stop  - Stop the development environment
echo   clean - Stop and remove containers, volumes, and networks
exit /b 1

:start
REM Start the development environment
echo Starting Docker Compose for development...
docker-compose -f ../docker-compose.base.yml -f ../docker-compose.dev.yml --env-file ./app.dev.env up --build
if errorlevel 1 (
    echo Failed to start Docker Compose. Exiting.
    exit /b 1
)
echo Development environment is running.
exit /b 0

:stop
REM Stop the development environment
echo Stopping Docker Compose for development...
docker-compose -f ../docker-compose.base.yml -f ../docker-compose.dev.yml --env-file ./app.dev.env down
if errorlevel 1 (
    echo Failed to stop Docker Compose. Exiting.
    exit /b 1
)
echo Development environment stopped.
exit /b 0

:clean
REM Clean up the development environment
echo Cleaning up Docker Compose for development...
docker-compose -f ../docker-compose.base.yml -f ../docker-compose.dev.yml --env-file ./app.dev.env down -v --remove-orphans
if errorlevel 1 (
    echo Failed to clean up Docker Compose. Exiting.
    exit /b 1
)
echo Development environment cleaned up.
exit /b 0
