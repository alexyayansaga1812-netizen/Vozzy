@echo off
title Vozzy - Subir correccion de APK a GitHub
cd /d "%~dp0"

echo ======================================================
echo    SUBIENDO CORRECCION DE COMPILACION A GITHUB
echo ======================================================
echo.

git add .
git commit -m "fix(ci): agregar npx cap add android antes de sync en GitHub Actions"
git push origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ======================================================
    echo  [EXITO!] Correccion subida a GitHub.
    echo ======================================================
) else (
    echo.
    echo [ERROR] No se pudo subir.
)

echo.
pause
