<#
  PowerShell ChefDotNet Module
  This module contains a set of wrapper scripts which 
  support chef-client operations
 #>

$moduleDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$moduleLibDir = "$moduleDir/lib"

ls -path $moduleLibDir -filter *.ps1 | % { . $_.FullName }

Get-Command | ? { 
    $_.CommandType.ToString() -eq "Function" 
} | ? { 
    $_.ModuleName -eq  "ChefDotNet" 
} | % {
	Export-ModuleMember $_
}
