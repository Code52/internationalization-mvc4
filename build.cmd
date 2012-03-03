@echo Off
SETLOCAL
SET VERSION=0.1.1
SET NUGET=build\nuget.exe

set config=%1
if "%config%" == "" (
   set config=Debug
)

%WINDIR%\Microsoft.NET\Framework\v4.0.30319\msbuild build.proj /p:Configuration="%config%" /m /v:M /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false

mkdir artifacts

.\build\nuget.exe pack src\Code52.i18n\NuSpec\Code52.i18n.nuspec -Version %VERSION% -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.Web\NuSpec\Code52.i18n.Web.nuspec -Version %VERSION% -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.MVC3.Logic\NuSpec\Code52.i18n.MVC3.Logic.nuspec -Version %VERSION% -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.MVC3.All\NuSpec\Code52.i18n.MVC3.All.nuspec -Version %VERSION% -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.MVC4.Logic\NuSpec\Code52.i18n.MVC4.Logic.nuspec -Version %VERSION% -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.MVC4.All\NuSpec\Code52.i18n.MVC4.All.nuspec -Version %VERSION% -OutputDirectory artifacts