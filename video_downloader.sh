#!/bin/bash

# Colors define karein
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
cyan="\e[1;36m"
reset="\e[1;0m"
if ! command -v yt-dlp &> /dev/null; then
  pkg install yt-dlp -y
  sudo apt install yt-dlp -y
fi
# User se URL input lein
printf "${cyan}\n"
read -p "Please enter the video URL : " url
printf "${reset}\n"
# Default download path
default_path="/sdcard/Downloads/"

# Agar user ne URL nahi diya toh error dikhayein aur exit karein
if [ -z "$url" ]; then
    echo -e "${red}Error: Koi URL provide nahi kiya!${reset}"
    exit 1
fi

# User se saving path input lein
echo -e "${yellow}Enter saving path (Default: ${default_path}) ${reset}"
#read -p "Enter saving path: " path

#user se number se path input lein
echo -e "${blue}Select saving path : ${reset}"
echo -e "${yellow}[1] => /home/kali/Desktop/${reset}"
echo -e "${yellow}[2] => /sdcard/Downloads/${reset}"
read -p "Select saving path : " path
# Agar user ne koi path nahi diya toh default path set karein
if [ -z "$path" ]; then
    path="$default_path"
elif [ "$path" -eq 1 ]; then
        path="/home/kali/Desktop/"
elif [ "$path" -eq 2 ]; then
        path="/sdcard/Downloads/"
fi

# User se resolution input lein
echo -e "${blue}Select resolution (e.g., 240, 360, 480, 720, 1080): ${reset}"
echo -e "${yellow}[1] 240p"
echo -e "${yellow}[2] 360p"
echo -e "${yellow}[3] 480p"
echo -e "${yellow}[4] 720p"
echo -e "${yellow}[5] 1080p"
echo -e "${blue}"
read -p "select option : " option
echo -e "${reset}"
if [ "$option" -eq 1 ]; then
        option=240
elif [ "$option" -eq 2 ]; then
        option=360
elif [ "$option" -eq 3 ]; then
	option=480
elif [ "$option" -eq 4 ]; then
	option=720
elif [ "$option" -eq 5 ]; then
	option=1080
else
       echo "Please select valid option **"
       exit 1;
fi

# Downloading message show karein
echo -e "${green}Downloading... Please wait!${reset}"

# yt-dlp command jo video download karega
yt-dlp -f "bestvideo[height=${option}]+bestaudio[ext=m4a]" "$url" -o "${path}/%(title)s.%(ext)s" --progress

# Download complete hone ka message
echo -e "${green}✅ Download Completed!${reset}"
