# functions
edit() { $EDITOR $1 }

# wirelab
ssh_wiredev() {
	ssh $1@31.7.6.182
}

# Resource integrity hash for a file fe: https://code.jquery.com/jquery-2.1.4.min.js
sri_hash() {
	curl -s $1 | \
   	openssl dgst -sha384 -binary | \
    openssl base64 -A
}

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

# ignore a file
gitignore() { 
	echo $1 >> .gitignore
}

# make github  repo from current dir
mk_repo_dir() {
	if [ "$1" = "org" ]; then 
		gh repo create $GITHUB_ORG/$2 --private --source=. --remote=upstream
		git remote add origin git@github.com:$GITHUB_ORG/$2.git
	else
		gh repo create $1 --private --source=. --remote=upstream
		git remote add origin git@github.com:$GITHUB_USER/$1.git
	fi
	git add --all
	git branch -M main
	git push -u origin main
}

# make github repo from scratch
mk_repo() {
	if [ "$1" = "org" ]; then
		gh repo create $GITHUB_ORG/$2 --private --clone
		cd $2		
	else
		gh repo create $GITHUB_USER/$1 --private --clone
		cd $1
	fi
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
db() {
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
# toogle bluetooth
toggle_bluetooth() {
	blueutil -p 0
	blueutil -p 1
}

# archive some stuff 
archive () {
   zip -r "$1".zip -i "$1" ;
}

# symlink to dottools which is in path
symlink() {
	filename=$(basename $1)
	filedir=$(dirname $1)
	sourceFile="$1"
	symlink=$DOTFILES/symlinks/$filename
	if [ -f $symlink ] ; then
		echo "Symbolic link already exists for $filename in $symlink"
	else
		ln -s $1 $symlink
		echo "Symbolic link created in $symlink"
	fi
	
}

# remove the symlink
unsymlink() {
	filename=$(basename $1)
	symlink="$DOTFILES/symlinks/$filename"
	if [ -f $symlink ] ; then
		unlink $symlink
		echo "Symbolic link removed"
	else
		echo "No symbolic link found at $symlink"
	fi
}
