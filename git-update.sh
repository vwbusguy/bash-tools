
#Multiple directories are space delimited
GITDIRS="/git $HOME/Projects";

for GITDIR in $GITDIRS;
	do if [ -d "$GITDIR/.git" ];
		then echo -e "\n $d :" ; 
		cd $GITDIR ;
		git pull ;
	else for d in $GITDIR/* ;
		do if [ -d "$d/.git" ]; 
			then echo -e "\n $d :" ; 
			cd $d ; 
			git pull ; 
			fi;
		done;
	fi;
done
