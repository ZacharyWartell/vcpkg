vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    #REPO https://github.com/vrpn/vrpn.git
    REPO vrpn/vrpn
    REF version_07.35
    SHA512 9a4225e01d07f1a298cd1fc5b938e4be57c03b2c82560a2a77cc327a4a83cbde6b88f796fd6071f7bd8de7ebbb6a8bac86b56fa3025697b5bb7820a7cc71862a
    #HEAD_REF version_07.35
)

set(VRPN_INSTALL TRUE)
set(VRPN_SUBPROJECT_BUILD)
vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}/quat")
vcpkg_cmake_install()

file(INSTALL "${SOURCE_PATH}/README.Legal" DESTINATION "${CURRENT_PACKAGES_DIR}/share/vrpn-quat" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")