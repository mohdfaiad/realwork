echo off
rem ---> %1- Compiler Path (DCC32.exe).   
rem ---> %2- DPK Path. 
rem ---> %3- Shared Lib Path.
rem ---> %4- Source Path
rem ---> %5  Text file for logs located at "<MyDocument>\Gnostice\eDocEngine\RecompilerLogsShared.txt"

rem --> Start running batch file
cd %4          

rem --> Select the drive if previous command could not change the drive
%6             

rem --> Write Date to txt file 
date /t >> %5      

rem --> Write Time to txt file 
time /t >> %5      

rem --> Write Time to txt file echo "Runtime" >> %5
rem ----------------------------------------Exp Intf Run Time for Delphi-------------------------------------------------
%1 -B %2 -I%3 -I%4 -N%3 -LE%3 -NB%3 -LN%3 -U%3 -U%4 -$A+B-C-D-H+I-J-L-M-N+O+P+Q-R-S-T-U-V+W-X+Y- >>%5
%1 -B %2 -DBCB -JPHNE -JP -I%3 -I%4 -N%3 -LE%3 -NB%3 -LN%3 -U%3 -U%4 -$A+B-C-D-H+I-J-L-M-N+O+P+Q-R-S-T-U-V+W-X+Y- >>%5

echo "OOOOOOOOBBBBJJJJJ" >> %5
%1 -B %2 -JPHNE -JP -I%3 -I%4 -N%3 -NB%4 -U%3 -U%4 >> %5

TLIB.EXE %2.lib

rem ---------Tocheck if there is any error, setting the ErrorLevel value to ERROR variable and using in the code---------
cd ..\..\..\eDocEngine VCL\eDocEngineRecompiler
echo ERROR=%ERRORLEVEL% >Status.txt