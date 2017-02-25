touch streamcheck.txt
date >> vlc.log
hw_ids="`/usr/bin/aplay -l | grep  USB|cut -c 6 | tr -d '\r'| tr -d '\n'`"
for ((i=0;i<${#hw_ids}; i++)); do
   hw_id=${hw_ids:$i:1}
   a=""
   a=(`/bin/ps -ef | /bin/grep hw:$hw_id,0 | grep -v grep`)
   if [ ! "$a" ]; then /usr/bin/cvlc alsa://hw:$hw_id,0 --sout="#transcode{acodec=vorb,channels=2}:std{access=http,mux=ogg,dst=0.0.0.0:808$hw_id}" &
   fi
done
