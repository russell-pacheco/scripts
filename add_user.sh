#!/bin/bash

useradd $1
usermod -aG $2 $1 
echo "$1:test123" | chpasswd
chage -d 0 $1
