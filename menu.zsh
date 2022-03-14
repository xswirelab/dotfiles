#!/bin/sh

#PS3="Where do you want to go? "
#
#locations=(quit home config dotfiles sites scripts tools)

#!/bin/bash

##
# BASH menu script that checks:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections
#   - Kernel version
##

server_name=$(hostname)

memory_check() {
    echo ""
	echo "Memory usage on ${server_name} is: "
	free -h
	echo ""
}

cpu_check() {
    echo ""
	echo "CPU load on ${server_name} is: "
    echo ""
	uptime
    echo ""
}

tcp_check() {
    echo ""
	echo "TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo ""
}

kernel_check() {
    echo ""
	echo "Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo ""
}

all_checks() {
	memory_check
	cpu_check
	tcp_check
	kernel_check
}

##
# Color  Variables
##
colors=(
 clear
 black
 red
 green
 orange
 blue
 purple
 cyan
 light_gray
 dark_gray
 light_red
 light_green
 yellow
 light_blue
 light_purple
 light_cyan
 white
)

clear='\033[0m'
black='\033[0;30'
red='\033[0;31'
green='\033[0;32'
orange='\033[0;33'
blue='\033[0;34'
purple='\033[0;35'
cyan='\033[0;36'
light_gray='\033[0;37'
dark_gray='\033[1;30'
light_red='\033[1;31'
light_green='\033[1;32'
yellow='\033[1;33'
light_blue='\033[1;34'
light_purple='\033[1;35'
light_cyan='\033[1;36'
white='\033[1;37'
##
# Color Functions
##

colorGreen(){
	echo "${green}$1${clear}"
}
colorBlue(){
	echo "${blue}$1${clear}"
}
colorRed(){
	echo "${red}$1${clear}"
}
unknown_will_exit() {
  echo "${red}Have a nice day!${clear}"
}

menu(){
  echo "
  $(colorRed 'Magnificent menu')
  $(colorGreen '1)') Terminal: add alias
  $(colorGreen '2)') Git: setup repo
  $(colorGreen '3)') Folder: add to spy directories
  $(colorGreen '4)') Kernel version
  $(colorGreen '5)') Check All
  $(colorGreen '0)') Exit
  $(colorBlue 'Choose an option:') "
  read a
    case $a in
      1) memory_check ; menu ;;
      2) cpu_check ; menu ;;
      3) tcp_check ; menu ;;
      4) kernel_check ; menu ;;
      5) all_checks ; menu ;;
      0) exit 0 ;;
      *) unknown_will_exit;;
    esac
}

# Call the menu function
menu