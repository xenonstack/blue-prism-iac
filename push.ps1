param(
	[parameter()]
	[string[]]$releasename,
	[string[]]$tag
)



$tagged_release = "${releasename}-${tag}.bprelease"


git add $tagged_release
git commit -m "Commit by Jenkins for Build"
git push
