param(
	[parameter()]
	[string[]]$releasename,
	[string[]]$username,
    	[string[]]$password,
	[string[]]$tag=''
)




$WantFile = "C:\Program Files\Blue Prism Limited\Blue Prism Automate\AutomateC.exe"
$FileExists = Test-Path $WantFile


$releasename = "${releasename}.bprelease"

if($tag) {            
    Write-Host "No tag to be imported."           
} else {            
    $releasename = "${releasename}-${tag}.bprelease"        
}

Write-Host $releasename

If ($FileExists -eq $True) {
& "C:\Program Files\Blue Prism Limited\Blue Prism Automate\AutomateC.exe" /importrelease $releasename /user $username $password
}

Else {
Write-Host "Blue Prism AutomateC not exist"
}
