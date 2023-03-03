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

Copy-Item "$ScriptRoot/../TestDependencies/$Os/SQLite.Interop.dll" "$ScriptRoot/../TestDependencies/"
Import-Module "$ScriptRoot/../TestDependencies"
Test-Dependencies