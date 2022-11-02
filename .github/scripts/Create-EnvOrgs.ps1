$output = Get-Content ./raw.json | ConvertFrom-Json

Write-Output $output.data.enterprise.organizations.nodes


$orgsArry = @()

foreach ($org in $output.data.enterprise.organizations.nodes) {
    $envObj = [PSCustomObject]@{
            name = "$($org.login)"
            id = $($org.databaseId)
            type = ["public", "private"]
            description = "$($org.description)"
        }
    Write-Output "This is the object: "
    Write-Output $envObj
    $orgsArry+=$envObj
    Write-Output "This is the array inside the loop"
    Write-Output $orgsArry
  }

$orgsArry | ConvertTo-Json -Depth 10 | Out-File -FilePath "orgs.json"
