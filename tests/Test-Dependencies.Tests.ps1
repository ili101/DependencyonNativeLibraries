BeforeAll {
    # Import-Module "$PSScriptRoot/../TestDependencies" #-Force
    $ScriptRoot = $PSScriptRoot ? $PSScriptRoot : '.'
    $ScriptRoot = Resolve-Path $ScriptRoot
}

Describe "Test-Dependencies" {
    <#
    It "Test Copy" {
        try {
            # $Job = Start-Job -FilePath "$ScriptRoot/Copy.ps1" -WorkingDirectory $ScriptRoot
            { Start-Job -FilePath "$ScriptRoot/Copy.ps1" -WorkingDirectory $ScriptRoot | Receive-Job -Wait -ErrorAction Stop } | Should -Not -Throw
        }
        finally {
            # $Job | Remove-Job
            Start-Sleep -Milliseconds 100
            Remove-Item "$ScriptRoot/../TestDependencies/SQLite.Interop.dll"
        }
        # Test-Dependencies | Should -BeLike 'SQLite version*'
    }

    It "Test Auto" {
        try {
            { Start-Job -FilePath "$ScriptRoot/Auto.ps1" -WorkingDirectory $ScriptRoot | Receive-Job -Wait -ErrorAction Stop } | Should -Not -Throw
        }
        finally {
        }
    }

    It "Test Copy x64" {
        try {
            { Start-Job -FilePath "$ScriptRoot/Copy-X64.ps1" -WorkingDirectory $ScriptRoot | Receive-Job -Wait -ErrorAction Stop } | Should -Not -Throw
        }
        finally {
            Start-Sleep -Milliseconds 100
            Remove-Item "$ScriptRoot/../TestDependencies/x64/" -Recurse
        }
    }

    It "Test Copy wrong" {
        try {
            { Start-Job -FilePath "$ScriptRoot/Copy-Wrong.ps1" -WorkingDirectory $ScriptRoot | Receive-Job -Wait -ErrorAction Stop } | Should -Not -Throw
        }
        finally {
            Start-Sleep -Milliseconds 100
            Remove-Item "$ScriptRoot/../TestDependencies/SQLite.Interop.dll"
        }
    }
    #>
    It "Test Auto extra extensions" {
        try {
            { Start-Job -FilePath "$ScriptRoot/Rename-ExtraExtensions.ps1" -WorkingDirectory $ScriptRoot | Receive-Job -Wait -ErrorAction Stop } | Should -Not -Throw
        }
        finally {
            Start-Sleep -Milliseconds 100
            Rename-Item "$ScriptRoot/../TestDependencies/win-x64/SQLite.Interop.dll.dll" "SQLite.Interop.dll"
            Rename-Item "$ScriptRoot/../TestDependencies/win-x86/SQLite.Interop.dll.dll" "SQLite.Interop.dll"
            Rename-Item "$ScriptRoot/../TestDependencies/linux-x64/SQLite.Interop.dll.so" "SQLite.Interop.dll"
            Rename-Item "$ScriptRoot/../TestDependencies/osx-x64/SQLite.Interop.dll.dylib" "SQLite.Interop.dll"
        }
    }
}
