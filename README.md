# BallPeen
Alert on Responder usage by automating Respounder.
- Feel free to rename any of the folders, scripts, or binaries to help with obfuscation.
- Install Ball Peen on one non-critical windows machine in each of your key subnets.  Focus on your workstation subnets.

## Run the below setup steps
- Use GPO to push this PS1 file and respounder.exe to C:\Program Files\elnao\.  
- Use GPO to lock the elnao folder down so only admins can get to it. 
- Use GPO to create a scheduled task to run the BallPeen.ps1 file every 5 minutes.
- Use GPO to create windows firewall rule allowing **only** respounder.exe on local ports xxxx-xxxxx. (forgot what ports)
- Use Windows Event Forwarding to forward event ID 1337 and 1338 from the application log to your SIEM.
  See Event Forwarding Query
- Create alert that fires when event ID 1338 is found. 

### Information on Responder (what we are trying to detect) can be found here:
https://github.com/SpiderLabs/Responder
Responder is a LLMNR, NBT-NS and MDNS poisoner, with built-in HTTP/SMB/MSSQL/FTP/LDAP rogue authentication server supporting NTLMv1/NTLMv2/LMv2, Extended Security NTLMSSP and Basic HTTP authentication.

### **Respounder** can be downloaded here:
https://github.com/codeexpress/respounder/releases
