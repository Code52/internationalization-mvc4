param($installPath, $toolsPath, $package, $project)
$path = [System.IO.Path]
$readmefile = $path::Combine($path::GetDirectoryName($project.FileName), "App_Readme\Code52.i18n.MVC.readme.txt")
$DTE.ItemOperations.OpenFile($readmefile)