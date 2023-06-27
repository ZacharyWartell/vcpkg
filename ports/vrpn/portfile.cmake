vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vrpn/vrpn
    #REF version_07.35    
    REF 601e52c129cac0318a67d8a9f7f3a00d99f50601    
    SHA512 7534120f49446b92dd9a15367b823772e5d41a1e548a2187dbdb6f3f1583341311b10d42ae41df040054c9b33d0320cc7f6fa8f67b9e8f27cd39b5dcb6659f26
    #SHA512 9a4225e01d07f1a298cd1fc5b938e4be57c03b2c82560a2a77cc327a4a83cbde6b88f796fd6071f7bd8de7ebbb6a8bac86b56fa3025697b5bb7820a7cc71862a
    #HEAD_REF version_07.35
    PATCHES
        CMakeLists.txt-vrpn.patch
        CMakeLists.txt-atmellib.patch
        CMakeLists.txt-gpsnmealib.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DVRPN_BUILD_CLIENT_LIBRARY=ON
        -DVRPN_BUILD_SERVER_LIBRARY=ON
        -DBUILD_TESTING=OFF
        -DBUILD_SHARED_LIBS=OFF
        -DVRPN_INSTALL=ON
        -DVRPN_VCPKG=ON)
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/README.Legal" DESTINATION "${CURRENT_PACKAGES_DIR}/share/vrpn" RENAME copyright)