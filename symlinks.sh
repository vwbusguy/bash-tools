for link in ` find . -type l | sed "s/^.//g" ` ; 
	do if ! grep -Fxq "$link" .gitignore  ;
		then echo "$link" >> .gitignore;
		echo -e "$link has been added to .gitignore\n";
	fi;
	done

sym='false'
pref='/git/www-cms'

while read line ;
	do if [ $sym == 'true' ];
		then if [ ! -h $pref/$line ] ;
			then sed -i "\,$line,d" .gitignore ;
			echo "$line was removed as it is no longer a symlink";
		fi;
	fi;
        if [ "$line" == '#Symlinks are ignored' ] ;
                then sym='true';
        fi;
	done < .gitignore
