$ScriptRoot = $PSScriptRoot ? $PSScriptRoot : '.'

$Os = if ($IsWindows) {
    'win-x64'
}
elseif ($IsLinux) {
    'linux-x64'
}
elseif ($IsMacOS) {
    'osx-x64'
}
else {
    throw 'Unsupported OS'
}

New-Item -ItemType Directory "$ScriptRoot/../TestDependencies/x64/" | Out-Null
Copy-Item "$ScriptRoot/../TestDependencies/$Os/SQLite.Interop.dll" "$ScriptRoot/../TestDependencies/x64/"
Import-Module "$ScriptRoot/../TestDependencies"
Test-Dependencies