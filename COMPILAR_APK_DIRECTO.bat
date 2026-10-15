@echo off
title Vozzy - Compilar APK Android
cd /d "%~dp0capacitor-app\android"

echo ======================================================
echo           COMPILANDO APK ANDROID DE VOZZY
echo ======================================================
echo.

if not exist "gradlew.bat" (
    echo [ERROR] No se encontro gradlew.bat en capacitor-app\android.
    pause
    exit /b 1
)

echo [INFO] Generando APK con Gradle (esto puede tardar 1 o 2 minutos la primera vez)...
echo.
call gradlew.bat assembleDebug

if %ERRORLEVEL% equ 0 (
    echo.
    echo ======================================================
    echo  [EXITO!] EL APK FUE GENERADO CORRECTAMENTE
    echo ======================================================
    echo.
    echo Ubicacion del archivo:
    echo capacitor-app\android\app\build\outputs\apk\debug\app-debug.apk
    echo.
    echo Abriendo la carpeta donde esta el APK para que te lo pases al celular...
    explorer "%~dp0capacitor-app\android\app\build\outputs\apk\debug"
) else (
    echo.
    echo ======================================================
    echo  [AVISO] No se pudo compilar por linea de comandos.
    echo ======================================================
    echo Esto pasa si tu sistema no tiene configurado Java JDK en el PATH.
    echo.
    echo Solucion facil:
    echo Vamos a abrir el proyecto en Android Studio para que lo compile con 1 clic.
    echo.
    pause
    cd /d "%~dp0capacitor-app"
    call npx cap open android
)

echo.
pause
