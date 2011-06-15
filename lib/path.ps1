$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. $scriptDir\util.ps1

Function Add-To-Path($pathToBeAdded) {
	$path = [environment]::GetEnvironmentVariable("Path","Machine")
	If(Path-Contains $pathToBeAdded) { return }
	if(!$path.EndsWith(";")) {
		$path = "$path;"
	}
	[Environment]::SetEnvironmentVariable("Path", $path+$pathToBeAdded, "Machine")
}

Function Execute-If-Path-Not-Contains($pathToBechecked, $block) {
	If(!(Path-Contains $pathToBechecked)) {
		& $block
	}
}

Function Path-Contains($pathToBechecked) {
	$path = [environment]::GetEnvironmentVariable("Path","Machine")
	return Contains-IgnoreCase $path $pathToBechecked
}