$ScriptRoot = $PSScriptRoot ? $PSScriptRoot : '.'

Rename-Item "$ScriptRoot/../TestDependencies/win-x64/SQLite.Interop.dll" "SQLite.Interop.dll.dll"
Rename-Item "$ScriptRoot/../TestDependencies/win-x86/SQLite.Interop.dll" "SQLite.Interop.dll.dll"
Rename-Item "$ScriptRoot/../TestDependencies/linux-x64/SQLite.Interop.dll" "SQLite.Interop.dll.so"
Rename-Item "$ScriptRoot/../TestDependencies/osx-x64/SQLite.Interop.dll" "SQLite.Interop.dll.dylib"

Import-Module "$ScriptRoot/../TestDependencies"
Test-Dependencies