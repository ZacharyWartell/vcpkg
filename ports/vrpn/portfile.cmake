vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    #REPO https://github.com/vrpn/vrpn.git
    REPO vrpn/vrpn
    REF v7.35
    # tar -C ./ -cf - --sort=name vrpn | sha512sum
    # ref:  https://stackoverflow.com/questions/545387/linux-compute-a-single-hash-for-a-given-folder-contents
    SHA512 dcc9b084be6c28b3b5e89076cf4b92320151abccdb7032f15bac3c4bf60223fb2267fe6f24b2735926487d1a3c043911441e2607d95457680f5a7eaa2bb345aa
    HEAD_REF version_07.35
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/README.Legal" DESTINATION "${CURRENT_PACKAGES_DIR}/share/vrpn" RENAME copyright)