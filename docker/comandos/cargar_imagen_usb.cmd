@echo off
echo ========================================
echo   Kalman - Cargar imagen desde USB
echo ========================================
echo.

REM Detectar letra de USB
REM Si se ejecuta desde el USB, usa su letra. Si no, busca en E:, F:, D:
set USB_DRIVE=%~d0
if "%USB_DRIVE%"=="C:" set USB_DRIVE=E:
if not exist "%USB_DRIVE%\" set USB_DRIVE=F:
if not exist "%USB_DRIVE%\" set USB_DRIVE=D:

echo USB detectado en: %USB_DRIVE%
echo Buscando imagen Docker...
echo.

REM Buscar archivo en diferentes ubicaciones
set IMAGE_FILE=

if exist "%USB_DRIVE%\kalman-kit-humble.tar" (
    set IMAGE_FILE=%USB_DRIVE%\kalman-kit-humble.tar
    echo [OK] Archivo encontrado en raiz del USB
    goto :found
)

if exist "%USB_DRIVE%\taller\kalman-kit-humble.tar" (
    set IMAGE_FILE=%USB_DRIVE%\taller\kalman-kit-humble.tar
    echo [OK] Archivo encontrado en carpeta taller
    goto :found
)

if exist "%USB_DRIVE%\ronaldo\kalman-kit-humble.tar" (
    set IMAGE_FILE=%USB_DRIVE%\ronaldo\kalman-kit-humble.tar
    echo [OK] Archivo encontrado en carpeta ronaldo
    goto :found
)

echo [ERROR] No se encuentra kalman-kit-humble.tar en el USB
echo.
echo Ubicaciones buscadas:
echo   %USB_DRIVE%\kalman-kit-humble.tar
echo   %USB_DRIVE%\taller\kalman-kit-humble.tar
echo   %USB_DRIVE%\ronaldo\kalman-kit-humble.tar
pause
exit /b 1

:found
echo.
echo Cargando imagen Docker (esto puede tardar varios minutos)...
docker load -i "%IMAGE_FILE%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   Imagen cargada exitosamente!
    echo ========================================
    echo.
    docker images kalmanrobotics/kalman-kit
) else (
    echo.
    echo ERROR: No se pudo cargar la imagen
    echo Verifica que Docker Desktop este abierto
)

echo.
pause
