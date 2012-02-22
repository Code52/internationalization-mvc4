
SETLOCAL
SET VERSION=0.1
SET NUGET=build\nuget.exe

mkdir artifacts

FOR %%G IN (build\*.nuspec) DO (
  %NUGET% pack %%G -Version %VERSION% -o artifacts
)


