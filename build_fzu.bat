@echo off
rem ============================================================
rem  Build proposal_fzu.tex with XeLaTeX + BibTeX (4 passes total)
rem  Usage: double-click this file, or run "build_fzu.bat" in cmd
rem  Note : comments here are ASCII on purpose (cmd reads GBK)
rem ============================================================
cd /d "%~dp0"

rem --- locate xelatex: PATH first, then common MiKTeX/TeX Live install dirs ---
where xelatex >nul 2>&1
if not errorlevel 1 goto :haspath
for %%D in (
  "C:\Program Files\MiKTeX\miktex\bin\x64"
  "C:\Program Files\MiKTeX\miktex\bin"
  "C:\Local\Programs\MiKTeX\miktex\bin\x64"
  "C:\texlive\2026\bin\windows"
  "C:\texlive\2025\bin\windows"
  "C:\texlive\2024\bin\windows"
) do if exist "%%~D\xelatex.exe" set "PATH=%%~D;%PATH%"
where xelatex >nul 2>&1
if errorlevel 1 (
  echo [ERROR] xelatex not found.
  echo         Install MiKTeX ^(https://miktex.org^) or TeX Live ^(https://tug.org/texlive/^),
  echo         then add its "bin" folder to PATH, or copy this project to a folder
  echo         whose path has no space, and re-run this script.
  pause
  exit /b 1
)
:haspath

set TEXINPUTS=.//;
set BIBINPUTS=.//;
set BSTINPUTS=.//;

echo [1/4] xelatex pass 1 ...
xelatex -interaction=nonstopmode proposal_fzu.tex > build_fzu_1.log 2>&1

echo [2/4] bibtex ...
bibtex proposal_fzu > build_fzu_bib.log 2>&1

echo [3/4] xelatex pass 2 ...
xelatex -interaction=nonstopmode proposal_fzu.tex > build_fzu_2.log 2>&1

echo [4/4] xelatex pass 3 ...
xelatex -interaction=nonstopmode proposal_fzu.tex > build_fzu_3.log 2>&1

echo.
if exist proposal_fzu.pdf (
  echo Build finished.
  echo PDF:  %~dp0proposal_fzu.pdf
  echo Logs: build_fzu_1.log / build_fzu_bib.log / build_fzu_3.log
) else (
  echo Build FAILED. Open build_fzu_3.log and search for lines starting with "!".
)
echo.
pause
