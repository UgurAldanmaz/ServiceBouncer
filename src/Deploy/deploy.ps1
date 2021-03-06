$scriptDir = Split-Path ((Get-Variable MyInvocation -Scope 0).Value.MyCommand.Path)

if(Test-Path $DeployPath)
{
    Write-Host "Removing Directory Found at $DeployPath"
    Remove-Item $DeployPath -Force -Recurse
    Start-Sleep -s 2
}

Write-Host "Creating Directory at $DeployPath"
New-Item $DeployPath -Type container

Write-Host "Deploying to $DeployPath"
Copy-Item "$scriptDir\Content\*" $DeployPath -Force -Recurse