@echo off
chcp 65001 >nul
echo images-list.js を生成中...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0generate-list.ps1"
echo.
pause
