$Shell = $Host.UI.RawUI

$Shell.WindowTitle = "Powershell $($Host.Version.Major)"

$Desktop = "C:\\Users\\M1n1n-\\Desktop";						function Desktop { Set-Location $Desktop }
$Documents = "F:\\Data\\Documents";								function Documents { Set-Location $Documents }
$Coding = "F:\\Data\\Coding";									function Coding { Set-Location $Coding }
$Scripts = "F:\\Data\\Documents\\WindowsPowerShell\\Scripts";	function Scripts { Set-Location $Scripts }

New-Alias -Name "notepad" -Value "F:\\Program Files (x86)\\Notepad++\\Notepad++.exe"

Write-Host "Hyper 2`nPowershell $($Host.Version.Major)"

function prompt {
	Write-Host "`n$(Shorten-Path (Get-Location).Path)" -n -f ([ConsoleColor]::DarkGray)
	Write-Host " λ" -n -f ([ConsoleColor]::White)
	return " "
}

function Shorten-Path([string] $path) {
	$loc = $path.Replace($HOME, "~")
	$loc = $loc -replace "^[^:]+::", ""
	$loc = $loc -replace "\\\\", "\"
	$loc = $loc -replace "\\", "/" 
	return $loc
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
	Import-Module "$ChocolateyProfile"
}
