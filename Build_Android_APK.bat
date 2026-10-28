@echo off
title Tlahto - Generador de APK Android
cd /d "%~dp0\capacitor-app"

echo ======================================================
echo           TLAHTO - GENERADOR DE APK ANDROID
echo ======================================================
echo.

:: 1. Verificar Node.js
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Node.js no esta instalado.
    echo Por favor descargalo e instalalo desde: https://nodejs.org
    echo.
    pause
    exit /b 1
)

:: 2. Sincronizar archivos web a capacitor-app\www
echo [1/4] Sincronizando archivos web a capacitor-app\www...
if not exist "www" mkdir "www"
copy /y "..\index.html" "www\" >nul
copy /y "..\app.js" "www\" >nul
copy /y "..\emergency.js" "www\" >nul
copy /y "..\style.css" "www\" >nul
copy /y "..\manifest.json" "www\" >nul
copy /y "..\sw.js" "www\" >nul
if exist "..\fonts" xcopy /e /y /i "..\fonts" "www\fonts" >nul
if exist "..\icons" xcopy /e /y /i "..\icons" "www\icons" >nul
if exist "..\assets" xcopy /e /y /i "..\assets" "www\assets" >nul
echo [OK] Archivos web copiados correctamente a www.

:: 3. Verificar dependencias de Capacitor
echo [2/4] Verificando dependencias de Capacitor...
if not exist "node_modules\@capacitor\cli" (
    echo [INFO] Instalando paquetes de Capacitor...
    call npm install
    if %ERRORLEVEL% neq 0 (
        echo [ERROR] Fallo la instalacion de paquetes npm.
        pause
        exit /b 1
    )
) else (
    echo [OK] Dependencias de Capacitor ya estan listas.
)

:: 4. Verificar plataforma Android
echo [3/4] Verificando plataforma Android...
if not exist "android" (
    echo [INFO] Creando plataforma Android nativa...
    call npx cap add android
    if %ERRORLEVEL% neq 0 (
        echo [ERROR] No se pudo agregar la plataforma Android.
        pause
        exit /b 1
    )
) else (
    echo [OK] Proyecto nativo Android existente.
)

:: 5. Sincronizar assets con Android
echo [4/4] Sincronizando con el proyecto Android...
call npx cap telemetry off >nul 2>nul
call npx cap sync android
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Fallo al sincronizar assets con Android.
    pause
    exit /b 1
)
echo [OK] Sincronizacion completada con exito!
echo.

:: Menu de opciones
echo ======================================================
echo                 OPCIONES DE COMPILACION
echo ======================================================
echo  1. Abrir en Android Studio (Recomendado: compilar o firmar)
echo  2. Generar APK Debug directo por consola (requiere JDK)
echo  3. Salir (el proyecto Android ya quedo actualizado)
echo ======================================================
echo.
set /p OPCION="Selecciona una opcion (1, 2 o 3): "

if "%OPCION%"=="1" (
    echo.
    echo [INFO] Abriendo Android Studio...
    call npx cap open android
    echo.
    echo [GUIA] Una vez abierto Android Studio:
    echo        1. Espera que Gradle termine de sincronizar
    echo        2. Ve a Build ^> Build Bundle(s) / APK(s) ^> Build APK(s)
    echo        3. En la notificacion inferior toca 'locate' para ver tu APK
) else if "%OPCION%"=="2" (
    echo.
    echo [INFO] Compilando APK Debug con Gradle...
    if exist "android\gradlew.bat" (
        cd android
        call gradlew.bat assembleDebug
        if %ERRORLEVEL% equ 0 (
            echo.
            echo ======================================================
            echo  [EXITO] APK generado exitosamente en:
            echo  capacitor-app\android\app\build\outputs\apk\debug\app-debug.apk
            echo ======================================================
        ) else (
            echo.
            echo [AVISO] La compilacion por linea de comandos fallo.
            echo Esto ocurre comunmente si no tienes la variable JAVA_HOME o Android SDK en PATH.
            echo Te recomendamos usar la Opcion 1 para abrirlo en Android Studio.
        )
        cd ..
    ) else (
        echo [ERROR] No se encontro gradlew.bat en capacitor-app\android.
    )
) else (
    echo Saliendo...
)

echo.
pause
