BeforeAll {
    # Import-Module "$PSScriptRoot/../TestDependencies" #-Force
    $ScriptRoot = $PSScriptRoot ? $PSScriptRoot : '.'
    $ScriptRoot = Resolve-Path $ScriptRoot
}

Describe "Test-Dependencies" {
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
}
