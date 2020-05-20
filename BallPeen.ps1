####################################################
#  Alert on Responder Activity
#  Write Event ID 1337 or 1338 to Event Log
#  Author: 
#  Date:  6/14/2019
###################################################

$EventSource = "BallPeen"
$Event_ID = "1337"
$EventPriority = "Information"
$respounder_results = "C:\Program Files\elnao\Respounder.exe" -rhostname | out-String

 if ($respounder_results -like "*responder detected*")  {
   $EventPriority = "Warning"
   $Event_ID = "1338"
   }
else {
   $EventPriority = "Information"
   $Event_ID = "1337"
   }  

if ([System.Diagnostics.EventLog]::SourceExists($EventSource) -eq $False) {
    New-EventLog -LogName Application -Source $EventSource
    Write-EventLog -LogName Application -EntryType $EventPriority -EventId $Event_ID -Source $EventSource -Message $respounder_results
  }
else {
  Write-EventLog -LogName Application -EntryType $EventPriority -EventId $Event_ID -Source $EventSource -Message $respounder_results
  }
