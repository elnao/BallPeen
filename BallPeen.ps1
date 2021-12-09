####################################################
#  Alert on Responder Activity
#  Write Event ID 1337 or 1338 to Application Event Log
#  https://github.com/elnao/hashes
#  Date:  12/09/2021
###################################################

while($true)
{

    $EventSource = "BallPeen"
    $Event_ID = "1337"
    $EventPriority = "Information"
    $RandomNumber = get-random -minimum 3 -Maximum 10
    $RandomNumber = $RandomNumber -replace '\s',''
    $respounder_results = "C:\Program Files\elnao\Respounder.exe" -hostname "adminsrv-"$RandomNumber| out-String


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

    sleep 300

} 
