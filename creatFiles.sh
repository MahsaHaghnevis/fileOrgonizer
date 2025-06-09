#! /bin/bash

cd "$HOME"
#cd "$HOME/Desktop/newSample"
clear
echo "----->       Welcome ~~~~ in this script we create some files in the wd ~~~ " 

sleep 2

read -p  " ||||| Please Enter the number of file for each type you want -> " n

clear
echo "--- Now Starting to Create some files  --- "
echo " -----------------------------------------"

for ((i = 1 ; i<= n ; i++)); do 
  touch file$i.{doc,docx,txt,pdf}           # Documents
  touch file$i.{jpg,jpeg,gif,png}           # Images
  touch file$i.{mp4,avi,mkv,mov}            # Videos
  touch file$i.{mp3,wav,ogg,flac}           # Music
  touch file$i.{zip,rar}                    # Archives 
  touch file$i.tar.gz  
	
sleep 1 
echo  "creating files of $i number "

done

sleep 2



echo "~~~~~~~~~~~ creating files over ; Now you have these files :  "

ls ./ 


exit


### created by mahsa haghnevis

