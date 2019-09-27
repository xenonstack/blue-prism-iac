param(
	[parameter()]
	[string[]]$releasename,
	[string[]]$username,
        [string[]]$password
)




$WantFile = "C:\Program Files\Blue Prism Limited\Blue Prism Automate\AutomateC.exe"
$FileExists = Test-Path $WantFile

If ($FileExists -eq $True) {
& "C:\Program Files\Blue Prism Limited\Blue Prism Automate\AutomateC.exe" /importrelease $releasename /user $username $password
}

Else {
Write-Host "Blue Prism AutomateC not exist"
}
