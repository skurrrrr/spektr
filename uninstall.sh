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
rm /usr/local/bin/spektr.py /usr/local/bin/spektr_config.json /usr/local/bin/public_ip.json

# Add cron job
#(crontab -l; echo "*/1 * * * * sudo python /usr/local/bin/spektr.py") | crontab -