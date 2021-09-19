:: get admin
echo off
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

:: configure environment variables
set /p MYJAVA_HOME_PATH=Input Your JDK PATH:  
setx /M JAVA_HOME "%MYJAVA_HOME_PATH%"
setx /M CLASSPATH ".;%%JAVA_HOME%%\lib;%%JAVA_HOME%%\lib\tools.jar;"
setx /M PATH "%PATH%;%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;"
echo Completed.
pause