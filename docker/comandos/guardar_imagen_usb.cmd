@echo off
echo ========================================
echo   Kalman - Guardar imagen en USB
echo ========================================
echo.

REM Verificar que Docker esté corriendo
docker version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Docker no esta corriendo
    echo Por favor abre Docker Desktop
    pause
    exit /b 1
)

REM Verificar que la imagen exista
docker images kalmanrobotics/kalman-kit:humble | findstr "kalman-kit" >nul
if %ERRORLEVEL% NEQ 0 (
    echo La imagen no existe. Descargando...
    docker pull kalmanrobotics/kalman-kit:humble
)

echo.
echo Guardando imagen en archivo (6 GB, puede tardar varios minutos)...
docker save -o kalman-kit-humble.tar kalmanrobotics/kalman-kit:humble

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   Imagen guardada exitosamente!
    echo ========================================
    echo.
    echo Archivo creado: kalman-kit-humble.tar
    echo Tamaño aproximado: 6 GB
    echo.
    echo Ahora copia este archivo a tu USB:
    echo   copy kalman-kit-humble.tar E:\
    echo   (Cambia E: por la letra de tu USB)
) else (
    echo.
    echo ERROR: No se pudo guardar la imagen
)

echo.
pause
