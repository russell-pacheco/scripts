$count=0
Get-ChildItem | ForEach-Object -Process {$new_name="DBA_" + $count + "_" + $_.name; $count=$count + 1; Rename-Item -Path $_.name -NewName $new_name}