properties {
   $VersionSuffix = $null
   $BasePath = Resolve-Path ..
   $SrcPath = "$BasePath\src"
   $ArtifactsPath = "$BasePath\artifacts"
   $ProjectJsonPath = "$SrcPath\Burble.Abstractions\project.json"
#   $TestProjectJsonPath = "$SrcPath\Burble.Abstractions.Tests\project.json"
   $Configuration = if ($Configuration) {$Configuration} else { "Debug" }
}

task default -depends Clean, Build, Test, Package

task Clean {
   if (Test-Path -path $ArtifactsPath)
   {
      Remove-Item -path $ArtifactsPath -Recurse -Force | Out-Null
   }

   New-Item -Path $ArtifactsPath -ItemType Directory
}

task Build {
   exec { dotnet --version }
   exec { dotnet restore $ProjectJsonPath }
   exec { dotnet build $ProjectJsonPath -c $Configuration -f netstandard1.6 --no-incremental --version-suffix $VersionSuffix }
   exec { dotnet build $ProjectJsonPath -c $Configuration -f net451 --no-incremental --version-suffix $VersionSuffix }
}

task Test -depends Build {
#   exec { dotnet restore $TestProjectJsonPath }
#   exec { dotnet test $TestProjectJsonPath -c $Configuration -f netcoreapp1.0 }
#   exec { dotnet test $TestProjectJsonPath -c $Configuration -f net451 }
}

task Package -depends Build {
   exec { dotnet pack $ProjectJsonPath -c $Configuration -o $ArtifactsPath --version-suffix $VersionSuffix }
}
