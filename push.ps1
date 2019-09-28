param(
	[parameter()]
	[string[]]$releasename,
	[string[]]$tag,
	[string[]]$git_branch
)



$tagged_release = "${releasename}-${tag}.bprelease"


git add $tagged_release
git commit -m "Commit by Jenkins for Build $tag"
git push origin $git_branch
