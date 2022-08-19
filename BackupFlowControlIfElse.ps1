Param(
  [string]$Path = './app',
  [string]$DestinationPath = './',
  [switch]$PathIsWebApp
)
If (-Not (Test-Path $Path)) # check if directory at path exists
{
  Throw "The source directory $Path does not exist, please specify an existing directory"
}

$date = Get-Date -format "yyyy-MM-dd"
$DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')"

If ($PathIsWebApp -eq $True) {
  Try 
  {
    $ContainsApplicationFiles = "$((Get-ChildItem $Path).Extension | Sort-Object -Unique)" -match  '\.js|\.html|\.css'

    If ( -Not $ContainsApplicationFiles) {
      Throw "Not a web app"
    } Else {
      Write-Host "Source files look good, continuing"
    }
  } Catch {
   Throw "No backup created due to: $($_.Exception.Message)"
  }
}
If (-Not (Test-Path $DestinationFile)) # check if directory at path exists
{
  Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
  Write-Host "Created backup at $($DestinationPath + 'backup-' + $date + '.zip')"
} Else {
  Write-Error "Today's backup already exists"
}