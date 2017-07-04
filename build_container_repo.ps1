# Clone repository
cd C:\
git clone -b windows-core-attempt --single-branch https://github.com/mdavidsen/fuselibs-public

# Configure stuff and uno
cd C:\fuselibs-public

# Fix GPU dependency using mesa.
Invoke-WebRequest http://downloads.fdossena.com/geth.php?r=mesa-latest -OutFile mesa.zip
Expand-Archive mesa.zip mesa
Get-ChildItem -Path Source -Recurse -Include *Test.unoproj | Select-Object -ExpandProperty DirectoryName | Foreach-Object {
  $buildDir = Join-Path $_ build\Test\DotNet
  New-Item -Force -ItemType directory -Path $buildDir | Out-Null
  Copy-Item -Path mesa\opengl32.dll -Destination (Join-Path $buildDir opengl32.dll)
}

stuff\stuff install Stuff

stuff\uno --trace doctor
stuff\uno --trace test -tDotNet Source
