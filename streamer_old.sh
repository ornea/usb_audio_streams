touch streamcheck.txt
date >> vlc.log
a=(`/bin/ps -ef | /bin/grep hw:0,0 | grep -v grep`)
if [ ! "$a" ]; then /usr/bin/cvlc alsa://hw:0,0 --sout="#transcode{acodec=vorb,channels=2}:std{access=http,mux=ogg,dst=0.0.0.0:8080}" &
fi
b=(`/bin/ps -ef | /bin/grep hw:1,0 | grep -v grep`)
if [ ! "$b" ]; then /usr/bin/cvlc alsa://hw:1,0 --sout="#transcode{acodec=vorb,channels=2}:std{access=http,mux=ogg,dst=0.0.0.0:8081}" &
fi
c=(`/bin/ps -ef | /bin/grep hw:2,0 | grep -v grep`)
if [ ! "$c" ]; then /usr/bin/cvlc alsa://hw:2,0 --sout="#transcode{acodec=vorb,channels=2}:std{access=http,mux=ogg,dst=0.0.0.0:8082}" &
fi
c=(`/bin/ps -ef | /bin/grep hw:3,0 | grep -v grep`)
if [ ! "$c" ]; then /usr/bin/cvlc alsa://hw:3,0 --sout="#transcode{acodec=vorb,channels=2}:std{access=http,mux=ogg,dst=0.0.0.0:8083}" &
fi

This did not always work as sometimes after a reboot the integrated audio device would enumerate as hardware device 0 or card No 0

I found issues using this device so wanted to find a way to only stream USB devices that are connected. See streamer.sh for the solution
