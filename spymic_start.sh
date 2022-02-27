#!/bin/bash


if [ -e $SPYMIC_DIR/spymic.pid ]
then
	$SPYMIC_DIR/spymic_stop.sh	
fi

echo $$>$SPYMIC_DIR/spymic.pid
echo Started spymic, pid=`cat $SPYMIC_DIR/spymic.pid` >&2

while true
do
    HW=`cat /proc/asound/cards | grep "$MIC_NAME" | grep -o [0-9]*`
    
    echo $MIC_NAME
   
   if [ -z "$HW" ]
   then       
       :    
   else
       sudo ffmpeg -ac 1 -f alsa -i hw:$HW -acodec libvorbis -aq $AUDIO_QUALITY -ac 2 -content_type audio/ogg -f ogg icecast://source:$ICECAST_SRC_PWD@$ICECAST_SERVER:$ICECAST_PORT/spymic
   fi    

   sleep 1 
   
done


