param(
	[parameter()]
	[string[]]$releasename,
	[string[]]$tag
)
Write-Host $releasename
Write-Host $tag

$tagged_release = "${releasename}-${tag}.bprelease"
Write-Host $tagged_release

$releasename = "${releasename}.bprelease"
Write-Host $releasename

$WantFile = ".\$releasename"
Write-Host $WantFile

$FileExists = Test-Path $WantFile
Write-Host $FileExists


If ($FileExists -eq $True) {
& "cp $releasename $tagged_release"
}

Else {
Write-Host "Could Not Tag Release Artifact."
}
