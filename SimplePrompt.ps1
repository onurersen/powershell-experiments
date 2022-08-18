#Write-Output 'Hello World!'

$today = Get-Date -UFormat "%d/%m/%Y (%A)"
$name = Read-Host -Prompt "Please enter your name"
Write-Output "$today is the day $name began programming in Powershell"