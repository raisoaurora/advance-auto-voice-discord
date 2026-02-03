@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
cd /d "%~dp0"

set "configDir=configs"
set /a count=0

if exist ".env" (
  for %%F in (".env") do (
    set /a count+=1
    set "file!count!=.env"
  )
)

for %%F in ("%configDir%\*.env") do (
  if exist "%%~fF" (
    set /a count+=1
    set "file!count!=%configDir%\%%~nxF"
  )
)

if %count%==0 (
  echo Khong tim thay file config nao.
  echo Tao .env hoac dat file vao thu muc configs\
  pause
  exit /b 1
)

echo.
echo ===== Danh sach config =====
for /L %%i in (1,1,%count%) do (
  call echo %%i^. %%file%%i%%
)
echo.

set /p "choices=Chon config (vd: 1 3). Nhan A de chay tat ca: "

if /I "%choices%"=="A" set "choices="

if "%choices%"=="" (
  for /L %%i in (1,1,%count%) do (
    call set "config=%%file%%i%%"
    echo Starting: !config!
    start "voice-discord %%i" /D "%~dp0" cmd /k "chcp 65001 >nul && node index.js --env !config!"
  )
  goto :eof
)

for %%C in (%choices%) do (
  set "found="
  for /L %%i in (1,1,%count%) do (
    if "%%C"=="%%i" (
      set "found=1"
      call set "config=%%file%%i%%"
      echo Starting: !config!
      start "voice-discord %%i" /D "%~dp0" cmd /k "chcp 65001 >nul && node index.js --env !config!"
    )
  )
  if not defined found echo Khong hop le: %%C
)
