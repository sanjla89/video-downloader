#!/bin/bash
read -p "Enter Playlist url : " playlist_url
if [ -z "$playlist_url" ];
then
 echo "Error : url not provided !"
fi
yt-dlp --flat-playlist "$playlist_url"
read -p "Enter resulation ex- 240, 360 : " resulation
read -p "Enter starting video no. : " starting
read -p "Enter ending video no. : " ending

yt-dlp --yes-playlist \
--playlist-start "$starting" \
--playlist-end "$ending" \
-f "bestvideo[height=${resulation}]+bestaudio[ext=m4a]" \
-o "/sdcard/Downloads/%(playlist)s/%(playlist_index) - %(title)s.%(ext)s" \
"$playlist_url"

