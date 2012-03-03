param($installPath, $toolsPath, $package, $project)

#script to fix code-behind for resx
set-alias Write-Host -Name whecho
whecho "Restoring resource code-behinds (this may cause the project to be reloaded with a dialog) ..."
$resitems = @{}
foreach ($item in $project.ProjectItems) 
{
    if ($item.Name -eq "Resources") {
        $resources = $item
        foreach ($resitem in $resources.ProjectItems) {
            $codebehinditem = $NULL
            if ($resitem.Name.ToLower().EndsWith(".resx")) {
                $hasCodeBehind = $FALSE
                switch ($item.ProjectItems) { default {
                    if ($_.Name.ToLower() -eq $resitem.Name.ToLower().Replace(".resx", ".designer.cs")) {
                        $hasCodeBehind = $TRUE
                        $codebehinditem = $_
                    }
                }}
                if ($hasCodeBehind -eq $TRUE) {
                    $fn = $resitem.FileNames(0)
                    $cbfn = $codebehinditem.FileNames(0)
                    $codebehinditem.Remove()
                    $cb2 = $resitem.ProjectItems.AddFromFile($cbfn)
                }
                $resitems.Add("Resources\" + $resitem.Name, $resitem.FileNames(0))
                whecho $resitem.Name
            }
        }
    }
}
$project.Save($project.FullName)
$projxml = [xml](get-content $project.FullName)
$ns = New-Object System.Xml.XmlNamespaceManager $projxml.NameTable
$defns = "http://schemas.microsoft.com/developer/msbuild/2003"
$ns.AddNamespace("csproj", $defns)
foreach ($item in $resitems.GetEnumerator()) {
	$xpath = "//csproj:Project/csproj:ItemGroup/csproj:Compile[@Include=`"" + $item.Name.Replace(".resx", ".Designer.cs") + "`"]"
	$resxDesignerNode = $projxml.SelectSingleNode($xpath, $ns)
	
	if ($resxDesignerNode -ne $NULL) {
	
		$autogen = $projxml.CreateElement('AutoGen', $defns)
		$autogen.InnerText = 'True'
		$resxDesignerNode.AppendChild($autogen)
		
		$designtime = $projxml.CreateElement('DesignTime', $defns)
		$designtime.InnerText = 'True'
		$resxDesignerNode.AppendChild($designtime)
	}
	
	$xpath = "//csproj:Project/csproj:ItemGroup/csproj:EmbeddedResource[@Include=`"" + $item.Name + "`"]"
	$resxNode = $projxml.SelectSingleNode($xpath, $ns)

	$generator = $projxml.CreateElement('Generator', $defns)
	$generator.InnerText = 'PublicResXFileCodeGenerator'
	$resxNode.AppendChild($generator)
	
	if ($resxDesignerNode -ne $NULL) {
		$lastGenOutput = $projxml.CreateElement('LastGenOutput', $defns)
		$lastGenOutput.InnerText = $item.Name.Replace("Resources\", "").Replace(".resx", ".Designer.cs")
		$resxNode.AppendChild($lastGenOutput)
	}

}
$projxml.Save($project.FullName)