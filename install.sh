#!/bin/bash

echo "                                                 
███████╗██████╗ ███████╗██╗  ██╗████████╗██████╗ 
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
                                    V1.0          "

#make it executable
chmod +x /usr/local/bin/spektr/spektr.py

read -p "What shall we call this machine?: " this_machine

# Create the spektr_config.json file in /usr/local/bin/spektr
echo "{\"this machine\": \"$this_machine\", \"API\": \"milfrogs.com\"}" > /usr/local/bin/spektr/spektr_config.json > /usr/local/bin/spektr/spektr_config.json

# Give the file read permission to everyone
chmod 755 /usr/local/bin/spektr/spektr_config.json

# Add cron job
(sudo crontab -l; echo "*/1 * * * * sudo python3 /usr/local/bin/spektr/spektr.py") | crontab -