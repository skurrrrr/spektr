#!/bin/bash

echo "███████╗██████╗ ███████╗██╗  ██╗████████╗██████╗ 
██╔════╝██╔══██╗██╔════╝██║ ██╔╝╚══██╔══╝██╔══██╗
███████╗██████╔╝█████╗  █████╔╝    ██║   ██████╔╝
╚════██║██╔═══╝ ██╔══╝  ██╔═██╗    ██║   ██╔══██╗
███████║██║     ███████╗██║  ██╗   ██║   ██║  ██║
╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
                                                 
██████╗ ██╗   ██╗                                
██╔══██╗╚██╗ ██╔╝                                
██████╔╝ ╚████╔╝                                 
██╔══██╗  ╚██╔╝                                  
██████╔╝   ██║                                   
╚═════╝    ╚═╝                                   
                                                 
███████╗██╗  ██╗██╗   ██╗██████╗ ██████╗         
██╔════╝██║ ██╔╝██║   ██║██╔══██╗██╔══██╗        
███████╗█████╔╝ ██║   ██║██████╔╝██████╔╝        
╚════██║██╔═██╗ ██║   ██║██╔══██╗██╔══██╗        
███████║██║  ██╗╚██████╔╝██║  ██║██║  ██║        
╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝        
                                                 "
#copies to directory where cron can use. Change "cp" to "mv" to make this tidier
cp ./spektr.py /usr/local/bin/

#make it executable
chmod +x /usr/local/bin/spektr.py

read -p "What shall we call this machine?: " this_machine

# Create the spektr_config.json file in /usr/local/bin/
echo "{\"this machine\": \"$this_machine\", \"API\": \"milfrogs.com\"}" > /usr/local/bin/spektr_config.json > /usr/local/bin/spektr_config.json

# Give the file read permission to everyone
chmod 755 /usr/local/bin/spektr_config.json

# Add cron job
(sudo crontab -l; echo "*/1 * * * * sudo python3 /usr/local/bin/spektr.py") | crontab -