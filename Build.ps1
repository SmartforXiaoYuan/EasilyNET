# Taken from psake https://github.com/psake/psake

<#
.SYNOPSIS
  This is a helper function that runs a scriptblock and checks the PS variable $lastexitcode
  to see if an error occcured. If an error is detected then an exception is thrown.
  This function allows you to run command-line programs without having to
  explicitly check the $lastexitcode variable.
.EXAMPLE
  exec { svn info $repository_trunk } "Error executing SVN. Please verify SVN command-line client is installed"
#>
function Exec
{
    [CmdletBinding()]
    param(
        [Parameter(Position=0,Mandatory=1)][scriptblock]$cmd,
        [Parameter(Position=1,Mandatory=0)][string]$errorMessage = ($msgs.error_bad_command -f $cmd)
    )
    & $cmd
    if ($lastexitcode -ne 0) {
        throw ("Exec: " + $errorMessage)
    }
}

$solution = "EasilyNET.sln"
$artifacts = ".\artifacts"

if(Test-Path $artifacts) { Remove-Item $artifacts -Force -Recurse }

exec { & dotnet clean $solution -c Release }
exec { & dotnet build $solution -c Release }
exec { & dotnet test $solution -c Release --no-build -l trx --verbosity=normal }

# Core
exec { & dotnet pack .\src\EasilyNET.Core\EasilyNET.Core.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.WebCore\EasilyNET.WebCore.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.WebCore.Swagger\EasilyNET.WebCore.Swagger.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }

# Framework
exec { & dotnet pack .\src\EasilyNET.AutoDependencyInjection\EasilyNET.AutoDependencyInjection.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.AutoDependencyInjection.Core\EasilyNET.AutoDependencyInjection.Core.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.RabbitBus.AspNetCore\EasilyNET.RabbitBus.AspNetCore.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.RabbitBus.Core\EasilyNET.RabbitBus.Core.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.Security\EasilyNET.Security.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }

# Mongo
exec { & dotnet pack .\src\EasilyNET.Mongo.AspNetCore\EasilyNET.Mongo.AspNetCore.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.Mongo.ConsoleDebug\EasilyNET.Mongo.ConsoleDebug.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.Mongo.Core\EasilyNET.Mongo.Core.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.MongoDistributedLock\EasilyNET.MongoDistributedLock.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.MongoDistributedLock.AspNetCore\EasilyNET.MongoDistributedLock.AspNetCore.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.MongoGridFS.AspNetCore\EasilyNET.MongoGridFS.AspNetCore.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }
exec { & dotnet pack .\src\EasilyNET.MongoSerializer.AspNetCore\EasilyNET.MongoSerializer.AspNetCore.csproj -c Release -o $artifacts --include-symbols -p:SymbolPackageFormat=snupkg --no-build }