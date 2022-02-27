#!/bin/bash

# Check if script is run by root
# ----------------------------------------------------------------------------------------
if ! [ $(id -u) = 0 ]; then
   echo "Script has to be run by root!"
   exit 1
fi

chmod u+x *.sh
chmod u+x spymic 

# ffmpeg is required to stream audio from microphone to icecast server
sudo apt-get install ffmpeg -y
# install spymic service
sudo update-rc.d -f spymic remove
sudo cp ./spymic /etc/init.d
sudo update-rc.d spymic defaults
# start spymic service
sudo service spymic start


