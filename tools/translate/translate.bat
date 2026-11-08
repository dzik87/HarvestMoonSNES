@echo off
rem Wrapper for the translation tools on Windows: translate.bat check pl
rem Needs Python 3 on the PATH (py -3 is tried first).
where py >nul 2>nul
if %errorlevel%==0 (
  py -3 "%~dp0translate.py" %*
) else (
  python "%~dp0translate.py" %*
)
exit /b %errorlevel%
