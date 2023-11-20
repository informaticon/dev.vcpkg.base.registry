
execute_process(
  COMMAND
    "git ls-remote git@github.com:informaticon/lib.cpp.base.pbni-framework"
  RESULT_VARIABLE
    ret
)

vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL "$<IF:$<ret:0>,
    git@github.com:informaticon/lib.cpp.base.pbni-framework,
    https://github.com/informaticon/lib.cpp.base.pbni-framework
  >"
  REF 25352cea6430978e9431acdcb7a973ec25589d44
  HEAD_REF vcpkg-testing
)


vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DINF_VCPKG_INSTALL=ON
)
vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright"
# 	"PLACEHOLDER FILE\n"
# )

# file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
