vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO cgart/osgPPU
    # https://github.com/cgart/osgPPU.git
    #REF version_07.35    
    REF cb65b6b18ba23cb34fe9a939f44113c24a412422    
    SHA512 687082d501943049d1bbed0f0f5002c9779f375b412f4648c9dd1f10ea3b4ce3b449d4160d2953e0eb059db4c361db005113b2ded065b43baef3a0b447e62329        
    #PATCHES
    #    CMakeLists.txt-vrpn.patch
    #    CMakeLists.txt-atmellib.patch
    #   CMakeLists.txt-gpsnmealib.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DDYNAMIC_OSGPPU=ON
        #-DCMAKE_LIBRARY_OUTPUT_DIRECTORY="c:\\vcpkg\\buildtrees\\osg-ppu\\x64-windows-dbg\\lib"
    )
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/vrpn" RENAME copyright)