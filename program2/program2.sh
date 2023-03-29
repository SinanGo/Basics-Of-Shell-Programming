clear
echo "question-2 : random story!"
file=$1

create_story () {
for i in 1 3 5
do
	x=$[RANDOM % 3 + 1]  # x must be determined randomly between 1,3 and 5.
	
	case $x in
		1)x=1;;
		2)x=3;;
		*)x=5;;
	esac

	case $i in # for each file, x'th line is written to the story.
		1) 
		sed "${x}q;d" giris.txt > $file
		sed '2q;d' giris.txt >> $file
		;;
		3)
		sed "${x}q;d" gelisme.txt >> $file
		sed '2q;d' giris.txt >> $file
		;;
		*)
		sed "${x}q;d" sonuc.txt >> $file
		sed '2q;d' giris.txt >> $file
		;;
	esac
done
}

#file exist check
if [ -f "$file" ]	# if the file exist, it asks to user what to do.
then 				
	echo " $file does exist. Do you want it to be modified? (y/n): "
	read your_choice
	
	if [ $your_choice = y ]
	then
		create_story $file
	elif [ $your_choice = n ]
	then
		echo "Modification did not occured. System is closed.."
		exit 1
	else
		echo "You enterred a wrong input. System is closed.."
		exit 2
	fi
else
	create_story $file  # if the file does not exist, creates directly.
fi
echo "Done!"
exit 0