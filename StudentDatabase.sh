clear
while [ 1 ]
do
echo 1.Create/n 2.Display/n 3.Insert/n 4.Search/n 5.Modify/n 6.Delete/n 7.Exit

echo "Enter Choice=\c"
read ch
case $ch in
1)
	echo "Enter the Filename:"
	read fname
	if [ -e $fname ]
	then 
		echo "File Already Exists"
	else
		>> $fname
		echo "File Created Successfully"
	fi
	;;
2)
	echo "Enter File Name:"
	read fname
	if [ -e $fname ]
	then
		echo "The Content of the File:"
		sort -n $fname
	else
		echo "File Does Not Exists"
	fi
	;;
3)
	echo "Enter the File Name:"
	read fname 
	if [ -e $fname ]
	then 
		echo -n "Enter the Roll Number:"
	       read roll
       grep -w "$roll" $fname
ans=$?
echo answer=$ans
if [ $ans -eq 0 ]
then
	echo "Record Already Exists"
else
	echo -n "Enter Name:"
	read name
	echo $roll $name >> $fname
	echo "Record Inserted Successfully"
fi
else
	echo "File Does Not Exists"
	fi
	;;

4)
	echo "Enter the File Name:"
        read fname
        if [ -e $fname ]
        then
                echo -n "Enter the Roll Number:"
               read roll
       grep -w "$roll" $fname
ans=$?

if [ $ans -eq 0 ]
then
        echo "Record Found"
else
        echo "Record Not Found"
fi
else
	echo "File Not Exists"
	fi
	;;

5)
	echo -n "Enter File Name:"
	read fname
	if [ -e $fname ]
	then 
		echo -n "Enter Roll Number:"
		read roll
		grep -w "$roll" $fname
		ans=$?
		if [ $ans -eq 0 ]
		then
			echo -n "Enter NewRoll And NewName:"
			read nroll nname
			grep -w "$nroll" $fname
			ans=$?
			if [ ans -eq 0 ]
			then 
				echo Record Already present please try another roll number
			else
				grep -v "$roll" $fname >> temp
				echo "$nroll $nname" >> temp
				rm $fname
				cp temp $fname
				rm temp
				echo "Record Successfully Modified"
			fi
		else
			echo "Record Not Present"
		fi
	else
		echo "File Not Exists"
	fi
	;;

6)
	echo -n "Enter File Name:"
        read fname
        if [ -e $fname ]
        then
                echo -n "Enter Roll Number:"
                read roll
                grep -w "$roll" $fname
                ans=$?
                if [ $ans -eq 0 ]
		then
			grep -v "$roll" $fname >> temp
			rm $fname
			cp temp $fname
			rm temp
			echo "Record Successfully Deleted"
		else
			echo "Record Not Found"
		fi
		else
                echo "File Not Exists"
        fi
        ;;

7)exit
	;;

*) echo "Your Choice is Not Correct"
	;;
esac
done
