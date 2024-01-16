git add .
git commit -m "bump pbni-framework"
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version pbni-framework --verbose --overwrite-version
git add .
git commit -m "vcpkg add-version"