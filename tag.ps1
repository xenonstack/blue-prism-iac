param(
	[parameter()]
	[string[]]$releasename,
	[string[]]$tag
)




$WantFile = ".\$releasename"
Write-Host $WantFile
$FileExists = Test-Path $WantFile
Write-Host $FileExists
$tagged_release = "${releasename}-${tag}.bprelease"
Write-Host $tagged_release
$releasename = "${releasename}.bprelease"
Write-Host $releasename


If ($FileExists -eq $True) {
& "cp $releasename $tagged_release"
}

Else {
Write-Host "Could Not Tag Release Artifact."
}
