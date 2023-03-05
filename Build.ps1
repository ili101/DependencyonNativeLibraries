# # dotnet new -i Microsoft.PowerShell.Standard.Module.Template
# # dotnet new psmodule
# # dotnet new console --framework net7.0
# dotnet new classlib --framework netstandard2.0

# dotnet add package System.Data.SQLite.Core

foreach ($Rid in 'win-x64', 'win-x86', 'linux-x64', 'osx-x64') {
    dotnet publish --configuration Release -r $Rid
}
