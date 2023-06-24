Zachary Wartell

## Problem:

A personal OSG project crashes after switching to vcpkg and porting to OSG
3.6.5.  

Indication in MSVS 2022 that issue is that vcpkg ports of require libraries are generating .dll's that link with incompatible version of the MSVC run-time, eg.:

'TutorialProject.exe' (Win32): Loaded 'C:\vcpkg\installed\x64-windows\bin\collada-dom2.5-dp-vc140-mt.dll'. Symbols loaded.
'TutorialProject.exe' (Win32): Loaded 'C:\vcpkg\installed\x64-windows\bin\boost_filesystem-vc143-mt-x64-1_82.dll'. Symbols loaded.

### Attempt #1:

Made my own modification to: 

vcpkg\ports\collada-dom\vs-version-detection.patch

in attempt to force vcpkg compilation process to recognize and use MSVS 2022 compiler MSVC 17.x as reported by the #define _MSC_VER > 1933

- https://en.wikipedia.org/wiki/Microsoft_Visual_C%2B%2B

#### Outcome

Patch appears to be applied as visible in file:

vcpkg\buildtrees\collada-dom\src\1f440d20cd-d35daa2f13.clean/CMakeLists.txt

But the resulting 64 DLL is still:

vcpkg\buildtrees\collada-dom/x64-windows-dbg\dom/collada-dom2.5-dp-vc140-mt.dll

Ahh. but

vcpkg\buildtrees\collada-dom\x86-windows-dbg\dom/collada-dom2.5-dp-vc143-mt.dll






