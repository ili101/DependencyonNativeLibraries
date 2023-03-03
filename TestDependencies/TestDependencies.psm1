# Add-Type -Path "$PSScriptRoot/System.Data.SQLite.dll"

function Test-Dependencies {
    [CmdletBinding()]
    param ()

    $cs = "Data Source=:memory:"
    $stm = "SELECT SQLITE_VERSION()"

    $con = [System.Data.SQLite.SQLiteConnection]::new($cs)
    $con.Open()

    $cmd = [System.Data.SQLite.SQLiteCommand]::new($stm, $con)
    $version = $cmd.ExecuteScalar().ToString();

    Return "SQLite version: $version"
}