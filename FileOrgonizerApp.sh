#!/bin/bash

#cd "$HOME/Desktop/newSample"


#make sure to give acssess 

cd "$HOME"
echo ""
echo " +--------------------[   Welcome to the file organizer app $USER  ]--------------------+"
sleep 2 
clear
 
echo " +--------------------[   We are working in $HOME  ]--------------------+"
while true ; do
    
    echo ""
    echo ""
    echo "" 
    echo "+--------------------------------------------------------------------------------------+"
    echo "|Please choose an option:                                                              |"
    echo "+--------------------------------------------------------------------------------------+"
    echo "| 1) Organize files by type into folders (Documents, Images, Videos, Music, Archives)  |"
    echo "| 2) Move a specific file into a folder with your name                                 |"
    echo "| 3) Delete a specific file                                                            |"
    echo "| 4) Show detailed information about a file                                            |"
    echo "| Type 'E' to exit                                                                     |"                                                 
    echo "|                                                                                      |"
    echo "+--------------------------------------------------------------------------------------+"



    read -p "---> Enter your choice : " choice
    if [[ "$choice" == "E" ]] || [[ "$choice" == "e" ]] ; then 
     echo "We'll miss you :) ... GoodBye!"
     break 
    fi

   
case $choice in
        1)
            echo "You chose to organize files."
	    clear 
	    echo "---- Organizing files into folders ... Documents ... Images ... Videos ... Music ...  Archives"
            sleep 2
	    mkdir -p Documents Images Videos Music Archives
	    mv *.doc *.docx *.txt *.pdf Documents/ 2>/dev/null
	    mv *.jpg *.jpeg *.gif *.png Images/ 2>/dev/null
	    mv *.mp4 *.avi *.mkv *.mov Videos/ 2>/dev/null
 	    mv *.mp3 *.wav *.ogg *.flac Music/ 2>/dev/null
	    mv *.zip *.rar *.tar.gz Archives/ 2>/dev/null
	    
	     mkdir -p Other
		
	    for file in * ; do 
		if [ -f "$file" ]; then
		mv "$file" Other/
		fi
	    done 
	    echo "+------------------------------------------------------+"
	    echo "|-----> Files of this dir organized into their folders |"
	    echo "+------------------------------------------------------+"
	    echo " "
	    echo " Now you have these dir in this wd : "
            ls -d */
            
            ;;
        2)
	    
            clear 
            echo "You chose to move a desired file to a custom directory. " 
	    read -p "----> Enter the name of your file with its suffix (only one) : " name
	    echo "----STARTING THE OPERATION "
	    sleep 1
	    filepath=$(find . -type f -name "$name")	    
            if [ -z "$filepath" ] ; then 
		echo " --- Sorry couldn't find the file you asked for in this dir :( "
		continue
            else 
		echo "--- I Found it in "$filepath" . Yayyyyy ! "
		echo " " 
    		echo "... Starting the moving operation "
		
		newDirName="${name%.*}"
		mkdir -p "./$newDirName"
		echo " ------------- Moving the $name into $newDirName dir "
		sleep 1
		mv "$filepath" "$newDirName"/
		echo "+------------------------------------------------------+"
		echo "| DONE ! $name has been moved to $newDirName           |"
		echo "+------------------------------------------------------+"
		echo "Now you have these dir in your home : "
		ls -d */
	      fi  
           ;;
        3)
	    clear
            echo "You chose to delete a file."
	    read -p "---> Enter the name of the file you want to delete with its suffix : " name
	    filepath=$(find . -type f -name "$name")
	    if [  -z  "$filepath" ] ; then 
		echo "---- I Couldn't find $name file ."
		continue 
	    else 
		echo "---- I Found it at $filepath "
		read -p ">> Are you sure u wanna delete $filepath  of this dir ?[Y/N] " ans
		echo " " 
		if [[ "$ans" == [Yy] ]] ; then
			rm "$filepath"
			echo "+------------------------------+"
			echo "|--- $name  is now deleted !   |"
			echo "+------------------------------+"
		else	
			echo "+----------------------------------------------------------+"
			echo "| Deleting $name is now canceled.... back to the menu      |"
			echo "+----------------------------------------------------------+" 
		fi 
	    fi			
            ;;
        4)
	    clear
            echo "You chose to view file details."
	    read -p "----> Enter the file name you wish to see its details : " name
	    filepath=$(find . -type f -name "$name")
	    if [[ -z "$filepath" ]] ; then 
		echo "---- File $name was not here :( ... back to menu "
		continue
	    else
		echo " "
		echo "+ I Found the file in this dir and here is the result :"
		
		echo "$name status is :"
		echo " " 
		echo "--------------------------------------------------------------"
		stat "$filepath"
		echo "File Type is :-------------------------------------------------"
		file "$filepath"
		# make it to file
		
	        echo "--------------------------------------------------------------"
		if [ -s "$filepath" ] ; then 
			echo "This file is not empty "
			ext="${filepath##*.}"
        		if file "$filepath" | grep -qi "text"; then
				 read -p "Would you like to see its data ? [Y/N] " ans
                        if [[ "$ans" == [Yy] ]] ; then
				echo "=============="
				echo "File Content (20 lines) "
				echo "=============="
				head -n 20 "$filepath" 
				echo " "
				echo "============== The End of Preview "
			else 
				echo "Alright --- back tp menu "
			fi 
		fi
				
		else
			echo "I'm afraid , this file is empty ..."
		fi
		echo "---------------------------------------------- Done , back to menu "
		fi
           ;;
        *)
            echo "Invalid choice. Please select 1–4 or type E to exit."
            ;;
    esac
done




### created by mahsa haghnevis
