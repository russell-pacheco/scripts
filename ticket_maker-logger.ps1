param ($env)

if ($env -eq "storage")
{
C:\Users\Russell.Pacheco\Documents\Projects\Ticket_Makers\SECSNOW\storage_daily_task_report\env\Scripts\Activate.ps1
python C:\Users\Russell.Pacheco\Documents\Projects\Ticket_Makers\SECSNOW\storage_daily_task_report\create_ticket.py -t next_week > $null
}

if ($env -eq "tokyoops")
{
C:\Users\Russell.Pacheco\Documents\Projects\Ticket_Makers\SECSNOW\tokyoops_daily_task_report\env\Scripts\Activate.ps1
python C:\Users\Russell.Pacheco\Documents\Projects\Ticket_Makers\SECSNOW\tokyoops_daily_task_report\create_ticket.py -t next_week -g > $null
}

$date = Get-Date
$log_file = "C:\Users\Russell.Pacheco\Logs\ticket_maker.log"

if ($LASTEXITCODE -eq 0) 
{
	echo  "[$date] $env tickets were successfully created!" >> $log_file
}
else
{
	echo "[$date] There was an error. Please ensure the $env tickets were made." >> $log_file 
}
deactivate

