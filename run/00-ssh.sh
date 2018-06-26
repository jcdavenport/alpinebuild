#!/bin/sh

change_root_pwd() {
	if [ -z "$ROOT_PASS" ]; then
		# echo "root:root"|chpasswd
		echo "Change root password:"
		echo "ENV: ROOT_PASS"
	else
		echo "root:$ROOT_PASS"|chpasswd
		echo "Change root password to \"$ROOT_PASS\"".
	fi
	echo $LINE2
}

change_root_pwd
#exec /usr/sbin/sshd -D -e "$@"
