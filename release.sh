#!/bin/zsh
set -e

if [ -z "$1" ]; then
  printf "Please provide a version number:\n\n./release.sh 1.0.0\n\n"
  exit 1
fi

# Configuration
version=$1
versionName="v${version}"
tagName="BTCPayServer.LNbank/${versionName}"
tagDesc="LNbank ${versionName}"
csproj="./BTCPayServer.Plugins.LNbank.csproj"

# Parse changelog
notes=$(awk -v ver=${version} '/^#+ \[/ { if (p) { exit }; if ($2 == "["ver"]") { p=1; next} } p' CHANGELOG.md | sed -rz 's/^\n+//; s/\n+$/\n/g')
if [ -z "${notes}" ]; then
  printf "Please provide version details in the CHANGELOG.\n\n"
  exit 1
fi

# We're good, let's roll …
printf "\n=====> Update version\n"
sed -i "s%<AssemblyVersion>.*</AssemblyVersion>%<AssemblyVersion>$version</AssemblyVersion>%g" $csproj
sed -i "s%<PackageVersion>.*</PackageVersion>%<PackageVersion>$version</PackageVersion>%g" $csproj

printf "\n=====> Commit and tag\n\n"
git add .
git commit -a -m "${tagDesc}"
git tag "${tagName}" -a -m "${tagDesc}"
git push
git push --tags

printf "\n=====> Create release\n\n"
gh release create "${tagName}" --notes "${notes}"
