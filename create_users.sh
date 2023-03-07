#!/bin/bash

declare -i nusers
declare -i nsec

usage(){ 
	printf "\n\ncreate_users [-u|--username] n <username> [-s|--sector] n <sector name> \n"
	printf "Options:\n\n"
	printf " n 			     number of users/sector you want(required)"
	printf " -u | --usernames            username of the new account (required)\n"
	printf " -s | --sectors              create groups, directories and set permissions (optional)\n"
	printf "\n\n"
	exit 1
}

while [ $# -gt 0 ]; do
  case "$1" in
     -u | --username)
	nusers=$2
	users=(${@:3:nusers})
	shift
	;;
     -s | --sectors)
	nsec=$2
	sectors=(${@:3:nsec})
	shift
	;;
     -h | --help)
	usage
	;;
  esac
  shift
done

echo "Creating Directories..."
echo "Creating Groups..."
echo "Changing Owners"
echo "Setting Permissions..."
echo "Creating Users..."
printf "Groups\n\n"

for s in ${!sectors[@]}
do
  echo "type $s for ${sectors[$s]}"
  mkdir "/${sectors[$s]}"
  groupadd "grp_${sectors[$s]}"
  chown root:"grp_${sectors[$s]}" "/${sectors[$s]}"
  chmod 770 "/${sectors[$s]}"
done

printf "empty for no_group\n\n"

for u in ${users[@]}
do
  echo "witch group you want to add $u?"
  read grp
  useradd "$u" -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G "grp_${sectors[$grp]}"
done

echo "End"

