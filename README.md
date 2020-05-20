# BallPeen
Alert on Responder usage by automating Respounder.
Feel free to rename any of the folders, scripts or binaries to help with obfuscation.

## Run the below setup steps
- Use GPO to push this PS1 file and respounder.exe to C:\Program Files\elnao\.  
- Use GPO to lock the elnao folder down so only admins can get to it. 
- Use GPO to create a scheduled task to run the BallPeen.ps1 file every 5 minutes.
- Use Windows Event Forwarding to forward event ID 1337 and 1338 from the application log to your SIEM.
  See Event Forwarding Query
- Create alert that fires when event ID 1338 is found. 

### Information on Responder (what we are trying to detect) can be found here:
https://github.com/SpiderLabs/Responder

### **Respounder** can be downloaded here:
https://github.com/codeexpress/respounder/releases
