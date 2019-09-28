param(
	[parameter()]
	[string[]]$releasename,
	[string[]]$tag
)




$WantFile = ".\$releasename"
$FileExists = Test-Path $WantFile

$releasename = "${releasename}.bprelease"
$tagged_release = "${releasename}-${tag}.bprelease"

If ($FileExists -eq $True) {
& "cp $releasename $tagged_release"
}

Else {
Write-Host "Could Not Tag Release Artifact."
}
