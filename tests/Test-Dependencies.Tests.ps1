BeforeAll {
    # Import-Module "$PSScriptRoot/../TestDependencies" #-Force
    $ScriptRoot = $PSScriptRoot ? $PSScriptRoot : '.'
}

Describe "Test-Dependencies" {
    It "Test Copy" {
        try {
            pwsh -File "$ScriptRoot/Copy.ps1" | Should -BeLike 'SQLite version*'
        }
        finally {
            Remove-Item "$ScriptRoot/../TestDependencies/SQLite.Interop.dll"
        }
        # Test-Dependencies | Should -BeLike 'SQLite version*'
    }

    It "Test Auto" {
        try {
            pwsh -File "$ScriptRoot/Auto.ps1" | Should -BeLike 'SQLite version*'
        }
        finally {
        }
    }

    It "Test Copy x64" {
        try {
            pwsh -File "$ScriptRoot/Copy-X64.ps1" | Should -BeLike 'SQLite version*'
        }
        finally {
            Remove-Item "$ScriptRoot/../TestDependencies/x64/" -Recurse
        }
    }

    It "Test Copy wrong" {
        try {
            pwsh -File "$ScriptRoot/Copy-Wrong.ps1" | Should -BeLike 'SQLite version*'
        }
        finally {
            Remove-Item "$ScriptRoot/../TestDependencies/SQLite.Interop.dll"
        }
    }
}
