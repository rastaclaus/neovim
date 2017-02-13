#! /bin/bash
sudo pacman -S python-pylint python-jedi
cd bundle
cat  ../plugins.list | while read line
do
  IFS='/' read -a array <<< "$line"
  folder_name=$(echo ${array[4]} | sed 's/\.git//')
  echo $folder_name
  if ! [ -d $folder_name/ ]; then
    git clone $line
  else
    cd $folder_name
    git pull
    cd ..
  fi
done
cd ..
