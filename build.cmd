@echo Off
SETLOCAL
SET VERSION=0.1
SET NUGET=build\nuget.exe

set config=%1
if "%config%" == "" (
   set config=Debug
)

%WINDIR%\Microsoft.NET\Framework\v4.0.30319\msbuild build.proj /p:Configuration="%config%" /m /v:M /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false

mkdir artifacts

FOR %%G IN (build\*.nuspec) DO (
  %NUGET% pack %%G -Version %VERSION% -o artifacts
)


