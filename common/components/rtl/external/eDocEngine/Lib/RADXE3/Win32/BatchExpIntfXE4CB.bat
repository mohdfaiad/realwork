echo off
rem ---> %1- Compiler Path (DCC32.exe).   
rem ---> %2- DPK Path. 
rem ---> %3- Shared Lib Path.
rem ---> %4- DocEngine Lib Path.
rem ---> %5  DCL DPK Path.
rem ---> %6  Export Component Lib Path.
rem ---> %7  ExportReg.Pas.

date /t >> %9
time /t >> %9
echo ERROR=%ERRORLEVEL% >Status.txt

echo "ExpReg" >> %9
rem ----------------------------------------ExpReg.pas-------------------------------------------------
%1 -NSSystem -NSxml -NSSystem.Win -NSWinAPI -NSVcl -NSVcl.Imaging -NSData -NSBDE -B %7 -JL -JPHNE -I%3 -N0%4 -No%4 -NH%4 -U%3 -U%4 -U%6 -$A+B-C-D-H+I-J-L-M-N+O+P+Q-R-S-T-U-V+W-X+Y- >> %9

echo "Runtime" >> %9
rem ----------------------------------------Exp Intf Run Time for C++Builder-------------------------------------------------
%1 -NSSystem -NSxml -NSSystem.Win -NSWinAPI -NSVcl -NSVcl.Imaging -NSData -NSBDE -B %2 -JL -I%3 -LN%4 -LE%4 -NB%4 -N0%4 -NH%4 -U%3 -U%4 -U%6 -$A+B-C-D-H+I-J-L-M-N+O+P+Q-R-S-T-U-V+W-X+Y- >> %9

echo "Designtime" >> %9
rem ----------------------------------------Exp Intf Design Time for C++Builder----------------------------------------------
%1 -NSSystem -NSxml -NSSystem.Win -NSWinAPI -NSVcl -NSVcl.Imaging -NSData -NSBDE -B %5 -JL -I%3 -LN%4 -LE%4 -NB%4 -N0%4 -NH%4 -U%3 -U%4 -U%6 -$A+B-C-D-H+I-J-L-M-N+O+P+Q-R-S-T-U-V+W-X+Y- >> %9

rem ---------Tocheck if there is any error, setting the ErrorLevel value to ERROR variable and using in the code---------
echo ERROR=%ERRORLEVEL% >Status.txt