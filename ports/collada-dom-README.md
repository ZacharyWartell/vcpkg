Zachary Wartell

## Problem:

A personal OSG (OpenSceneGraph) project crashes after switching to vcpkg and porting to OSG 3.6.5.  
(The project code was dormant due to mis-fired Ph.D. hire in 2018 followed by COVID and piles of other career and family stuff).

Indication in MSVS 2022 is that issue is that vcpkg ports of require libraries are generating .dll's that link with incompatible version of the MSVC run-time, e.g.:

MSVS Output Window:

   'TutorialProject.exe' (Win32): Loaded 'C:\vcpkg\installed\x64-windows\bin\collada-dom2.5-dp-vc140-mt.dll'. Symbols loaded.
   'TutorialProject.exe' (Win32): Loaded 'C:\vcpkg\installed\x64-windows\bin\boost_filesystem-vc143-mt-x64-1_82.dll'. Symbols loaded.

Note the different vc140 prefixes. 

The crashing behavior is suggestive that indeed my final .exe is using libraries that are linked against differing 
and incompabile versions of the VCRUNTIME140D.dll (or related) MS C++ run-times.   (I've seen this type of crashing behavior before.  A seemingly perfectly good
heap allocated pointer/string/array cannot be processed properly and the crashes occur deep inside the MS C++ run-time source code itself).

### Attempt #1:

Made my own modification to: 

    vcpkg\ports\collada-dom\vs-version-detection.patch

Attempt to force vcpkg compilation process to recognize and use MSVS 2022 compiler MSVC 17.x as reported by the #define _MSC_VER > 1933.


#### Outcome

Patch appears to be applied as visible in file:

vcpkg\buildtrees\collada-dom\src\1f440d20cd-d35daa2f13.clean/CMakeLists.txt

Resulting 64 DLL is now named:

    PS C:\vcpkg> dir .\installed\x64-windows\debug\bin\collada-dom2.5-dp-vc143-mt.dll

But for some reason the dae OSG did not build, missing from:

    PS C:\vcpkg> dir .\installed\x64-windows\debug\plugins\osgPlugins-3.6.5

(The dae dll was there before).

### Attempt #1.1

#### Details

Clean:
    PS C:\vcpkg> .\vcpkg remove osg:x64-windows
    The following packages will be removed:
        osg:x64-windows
    Removing 1/1 osg:x64-windows
    PS C:\vcpkg> .\vcpkg remove collada-dom:x64-windows
    The following packages will be removed:
        collada-dom:x64-windows
    Removing 1/1 collada-dom:x64-windows
    PS C:\vcpkg>

Rebuild
    PS C:\vcpkg> .\vcpkg install osg[collada,plugins] --triplet x64-windows:


#### Outcome


## REFERNECES

- https://en.wikipedia.org/wiki/Microsoft_Visual_C%2B%2B
- https://cmake.org/cmake/help/latest/variable/MSVC_VERSION.html




