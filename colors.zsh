#!/bin/sh

# colors=(
# clear
# black
# red
# green
# orange
# blue
# purple
# cyan
# light_gray
# dark_gray
# light_red
# light_green
# yellow
# light_blue
# light_purple
# light_cyan
# white
#)

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
  echo "${black}$1${clear}"
  
if [ -z "$1" ] ; then
  echo "${black}$2${clear}"
  if [ "$1" = "black"] ; then
    echo "${black}$2${clear}"
  elif [ "$1" = "red"] ; then
    echo "${red}$2${clear}"
  elif [ "$1" = green] ; then
    echo "${green}$2${clear}"
  elif [ "$1" = "orange"] ; then
    echo "${orange}$2${clear}"
  elif [ "$1" = "blue"] ; then
    echo "${blue}$2${clear}"
  elif [ "$1" = "purple"] ; then
    echo "${purple}$2${clear}"
  elif [ "$1" = "cyan"] ; then
    echo "${cyan}$2${clear}"
  elif [ "$1" = "light_gray"] ; then
    echo "${light_gray}$2${clear}"
  elif [ "$1" = "dark_gray"] ; then
    echo "${dark_gray}$2${clear}"
  elif [ "$1" = "light_red"] ; then
    echo "${light_red}$2${clear}"
  elif [ "$1" = "light_green"] ; then
    echo "${light_green}$2${clear}"
  elif [ "$1" = "yellow"] ; then
    echo "${yellow}$2${clear}"
  elif [ "$1" = "light_blue"] ; then
    echo "${light_blue}$2${clear}"
  elif [ "$1" = "light_purple"] ; then
    echo "${light_purple}$2${clear}"
  elif [ "$1" = "light_cyan"] ; then
    echo "${light_cyan}$2${clear}"
  elif [ "$1" = "white"] ; then
    echo "${white}$2${clear}"
  else
    echo "Unknown argument supplied"
  fi
else
    echo "No argument supplied"
fi