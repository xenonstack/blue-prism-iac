param(
	[parameter()]
	[string[]]$releasename,
	[string[]]$username,
    	[string[]]$password,
	[string[]]$tag=''
)




$WantFile = "C:\Program Files\Blue Prism Limited\Blue Prism Automate\AutomateC.exe"
$FileExists = Test-Path $WantFile




if($tag) {            
    $releasename = "${releasename}-${tag}.bprelease"
} else {            
    $releasename = "${releasename}.bprelease"
}

Write-Host $releasename

If ($FileExists -eq $True) {
& "C:\Program Files\Blue Prism Limited\Blue Prism Automate\AutomateC.exe" /importrelease $releasename /user $username $password
}

Else {
Write-Host "Blue Prism AutomateC not exist"
}
