@echo off
title Vozzy - Subir a GitHub para generar APK
cd /d "%~dp0"

echo ======================================================
echo    SUBIENDO CONFIGURACION PARA GENERAR EL APK EN GITHUB
echo ======================================================
echo.

git add .
git commit -m "ci: agregar GitHub Action para generar APK automatico"
git push origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ======================================================
    echo  [EXITO!] Subido a GitHub.
    echo  GitHub ahora esta compilando tu APK en la nube.
    echo ======================================================
) else (
    echo.
    echo [ERROR] No se pudo subir a GitHub.
)

echo.
pause
