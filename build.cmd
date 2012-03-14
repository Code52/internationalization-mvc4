@echo Off
SETLOCAL
SET NUGET=build\nuget.exe

set config=%1
if "%config%" == "" (
   set config=Debug
)
set version=%2
if "%version%" == "" (
   set version=0.1.12
)

%WINDIR%\Microsoft.NET\Framework\v4.0.30319\msbuild build.proj /p:Configuration="%config%" /m /v:M /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false

rmdir artifacts /S /Q
mkdir artifacts

.\build\nuget.exe pack src\Code52.i18n.MVC\NuSpec\Code52.i18n.MVC3.nuspec -Version %VERSION% -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.MVC\NuSpec\Code52.i18n.MVC4.nuspec -Version %VERSION% -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.MVC3.Example\NuSpec\Code52.i18n.MVC3.Example.Razor.nuspec -Version %VERSION% -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.MVC4.Example\NuSpec\Code52.i18n.MVC4.Example.Razor.nuspec -Version %VERSION% -OutputDirectory artifacts