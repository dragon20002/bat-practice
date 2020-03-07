 REM	BAT  : file name to execute
 REM	ARGS : given arguments
 REM	VBS  : temp file path

 SET	bat=start tomcat9.bat
 SET	args= %*
 SET	vbs="%temp%\getadmin.vbs"

 REM	Write VBS
ECHO	SET	UAC=CreateObject^("Shell.Application"^) > %vbs%
ECHO	UAC.ShellExecute	"cmd.exe", "/c ""%~dp0%bat%"" %args:"=""%", "", "runas", 1 >> %vbs%

 REM	Execute VBS
%vbs%

 REM	Delete VBS
 DEL	%vbs%
