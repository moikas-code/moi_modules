@echo off
REM Dynamically get the directory where the script is located
SET "TARGET_DIR=%~dp0"

SET "LINK_NAME=moi_modules"

IF "%~1"=="" (
    echo Usage: %0 ^<path_to_godot_project_directory^>
    exit /b 1
)

mklink /D "%~1\%LINK_NAME%" "%TARGET_DIR%"
IF %ERRORLEVEL% == 0 (
    echo Symbolic link created at "%~1\%LINK_NAME%"
) ELSE (
    echo Failed to create symbolic link.
)