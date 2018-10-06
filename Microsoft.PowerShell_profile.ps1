$Shell = $Host.UI.RawUI

$Shell.WindowTitle = "Powershell $($Host.Version.Major)"

New-Alias -Name "notepad" -Value "F:\\Program Files (x86)\\Notepad++\\Notepad++.exe"

Write-Host "Hyper 1`nPowershell $($Host.Version.Major)"

function prompt {
	# theme
	$chost = [ConsoleColor]::DarkGreen
	$cterm = [ConsoleColor]::Magenta
	$cloc = [ConsoleColor]::Yellow

	Write-Host "`n$($env:UserName)@$($env:ComputerName) " -n -f $chost
	Write-Host "PS$($Host.Version.Major) " -n -f $cterm
	Write-Host "$(shorten-path (Get-Location).Path)" -n -f $cloc
	Write-Host "`nλ" -n
	return " "
}

function Shorten-Path([string] $path) {
	$loc = $path.Replace($HOME, "~\")
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
