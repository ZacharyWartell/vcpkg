vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    #REPO https://github.com/vrpn/vrpn.git
    REPO vrpn/vrpn
    REF version_07.35
    # tar -C ./ -cf - --sort=name vrpn | sha512sum
    # ref:  https://stackoverflow.com/questions/545387/linux-compute-a-single-hash-for-a-given-folder-contents
    SHA512 9a4225e01d07f1a298cd1fc5b938e4be57c03b2c82560a2a77cc327a4a83cbde6b88f796fd6071f7bd8de7ebbb6a8bac86b56fa3025697b5bb7820a7cc71862a
    #HEAD_REF version_07.35
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/README.Legal" DESTINATION "${CURRENT_PACKAGES_DIR}/share/vrpn" RENAME copyright)