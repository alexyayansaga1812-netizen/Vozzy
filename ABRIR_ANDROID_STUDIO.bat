@echo off
title Vozzy - Abrir en Android Studio
cd /d "%~dp0capacitor-app"

echo ======================================================
echo           ABRIENDO VOZZY EN ANDROID STUDIO
echo ======================================================
echo.
echo Abriendo Android Studio...
call npx cap open android
echo.
echo ======================================================
echo INSTRUCCIONES EN ANDROID STUDIO:
echo 1. Espera que termine de cargar abajo a la derecha.
echo 2. En el menu superior ve a:
echo    Build -^> Build Bundle(s) / APK(s) -^> Build APK(s)
echo 3. Cuando termine saldra un aviso abajo a la derecha,
echo    toca en "locate" para ver tu app-debug.apk listo.
echo ======================================================
echo.
pause
