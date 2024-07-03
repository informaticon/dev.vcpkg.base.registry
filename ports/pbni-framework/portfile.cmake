
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
  REF "216155a587b5dedae6a52e612c4926de2a6c781e"
  HEAD_REF "vcpkg-test"
)


vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/pbni-framework")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
