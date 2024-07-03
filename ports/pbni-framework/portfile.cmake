
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

vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL ${URL}
  REF "542217361a016e2feee5a0936375df69755cf3e9"
  HEAD_REF "main"
)


vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DINSTALL_CMAKEDIR="lib/share/pbni-framework"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup("")
vcpkg_copy_pdbs()

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
