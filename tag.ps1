param(
	[parameter()]
	[string[]]$releasename,
	[string[]]$tag
)



$tagged_release = "${releasename}-${tag}.bprelease"
$releasename = "${releasename}.bprelease"
$WantFile = ".\$releasename"
$FileExists = Test-Path $WantFile


If ($FileExists -eq $True) {
Copy-Item $releasename $tagged_release
}
Else {
Write-Host "Could Not Tag Release Artifact."
}
