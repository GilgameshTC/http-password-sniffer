# README: http-password-sniffer
A simple bash script to help with sniffing passwords sent over insecure http post requests.

## User Guide
**Demo attack:**
Website: http://testing-ground.scraping.pro/login (ip-address: 204.15.135.8)

1. Run start-sniffing script with root privilege by passing in the ip address of the http website you intend to sniff: 
>`sudo ./start-sniffing.sh 204.15.135.8`
2. Visit the website that you passed into the script
3. Key in user name & password, press login
> e.g. user name: admin | password: 12345
4. Run stop-sniffing script
>`sudo ./stop-sniffing.sh`
5. Done! You should see the user name & password inputed earlier being output to the terminal.
