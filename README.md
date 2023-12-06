# dev.vcpkg.base.registry
Registry to make PBNI Framework a vcpkg dependency

## Adding a port
Instructions by [vcpkg](https://learn.microsoft.com/en-us/vcpkg/produce/publish-to-a-git-registry).  
To make that both ssh and https Users can use the port,
you have to check which type is being used and change the URL accordingly.
```cmake
execute_process(
  COMMAND
    "git ls-remote git@github.com:informaticon/lib.cpp.base.pbni-framework"
  RESULT_VARIABLE
    ret
)

if(ret EQUAL "0")
  set(URL "git@github.com:informaticon/lib.cpp.base.pbni-framework")
else()
  set(URL "https://github.com/informaticon/lib.cpp.base.pbni-framework")
endif()
```

## Adding a version
1. Change `REF` in `./ports/{portname}/portfile.cmake`
2. Update `version` in `./ports/{portname}/vcpkg.json`
3. Run in root directory:

```ps1
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version {portname} --verbose
```

