
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
  REF "4ecb236ed028ed978dfeeb5795a2da325210a098"
  HEAD_REF "main"
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
# TODO
# 	"PLACEHOLDER FILE\n"
# )

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
