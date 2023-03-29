clear
echo "question-5 : wildcards!"

if [ $# -eq 0 ]
then
	echo "No argument is given! System is closed.."
	exit 0
elif [ $# -eq 1 ] #just the wildcard is given
then
	echo "$# argument is given. Please give permission for each file. (y/n)"
	before=$(ls -l | wc -l) # counts the number of files before the deletions
	rm -i $1 #asks for each file to delete
	after=$(ls -l | wc -l) # counts the number of files after the deletions	
	echo "`expr $before - $after` file(s) deleted" # gives the difference
elif [ $# -eq 2 ]
then  # the wildcard and the path are given. 
	echo "$# arguments are given."
	echo "Do you want to delete every file obeying the wildcard under $2 and its subdirectories? (y/n):" # if you say yes, all the files obeying the rule will be deleted without more asking.
	read your_choice
	
	if [ $your_choice = y ]
	then	
		num=$(find $2 -name $1 -type f | wc -l)
		find $2 -name $1 -type f -delete
		echo "$num file(s) deleted"
	elif [ $your_choice = n ]
	then
		echo "Deletion is cancelled. System is closed.."
		exit 3
	else
		echo "You enterred a wrong input. System is closed.."
		exit 4
	fi
else
	echo " More arguments than expected! System is closed.."
	exit 1
fi
