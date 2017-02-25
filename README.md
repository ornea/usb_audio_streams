# usb_audio_streams
auto streams any USB audio devices plugged into a ubuntu box

It attemps to find the Hardware Id for each USB audio device (like the cheap $2 audio USB device) plugged into the PC.

It then creates a VLC stream for each device. 

I use crontab -e 

* * * * * /bin/bash /home/user/streamer.sh

