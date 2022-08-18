# create-file.ps1
Param (
  $Path
)
New-Item $Path # Creates a new file at $Path.
Write-Host "File $Path was created"

#./CreateFile.ps1 -Path './newfile.txt' # File ./newfile.txt was created.
#./CreateFile.ps1 -Path './anotherfile.txt' # File ./anotherfile.txt was created.
