# functions
edit() { $EDITOR $1 }

# commit everything
commit() { 
	git add --all && git commit -m "$1" 
	git pull origin $2 
	git push origin $2 
}

# remove a branch
rm_branch() { 
	git branch -d $1 
	git push origin :$1 
}

# prune deleted branches
prune_branch() { 
	git remote prune origin 
}

# make branch and push it
mk_branch() { 
	git checkout -b $1 
	git push --set-upstream origin $1 
}

# make a new sh script 
mk_sh() { 
	echo "#!/bin/sh \n" > $1 
	chmod +x $1  
}

# make a dir and cd into it
mk_cd() { 
	mkdir $1 
	cd $1 
}
# add a new alias
mk_alias() { 
	echo "alias $1=\"$2\"" >> $DOTFILES/aliases.zsh 
}

# open a database
open_db() {
   	[ ! -f .env ] && { echo "No .env file found."; exit 1; }

   	DB_CONNECTION=$(grep DB_CONNECTION .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   	DB_HOST=$(grep DB_HOST .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   	DB_PORT=$(grep DB_PORT .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   	DB_DATABASE=$(grep DB_DATABASE .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   	DB_USERNAME=$(grep DB_USERNAME .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   	DB_PASSWORD=$(grep DB_PASSWORD .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)

   	DB_URL="${DB_CONNECTION}://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}"

   	echo "Opening ${DB_URL}"
	open $DB_URL
}

# database access
dbhelper() {
	if [ "$1" = "refresh" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    elif [ "$1" = "list" ]; then
        mysql -uroot -e "show databases" | perl -p -e's/\|| *//g'
	else
		echo "Command: db <argument> <param>"
		echo "available arguments:"
		echo "- list" 
		echo "- refresh <database>" 
		echo "- create <database>" 
		echo "- drop <database>"
    fi
}

# silence output
silent() {
   "$@" >& /dev/null
}

# check weather
weather() {
   city="$1"

   if [ -z "$city" ]; then
      city="Enschede"
   fi

   eval "curl http://wttr.in/${city}"
}

# archive some stuff 
archive () {
   zip -r "$1".zip -i "$1" ;
}
