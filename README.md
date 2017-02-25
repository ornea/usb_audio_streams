# usb_audio_streams
auto streams any USB audio devices plugged into a ubuntu box

It attemps to find the Hardware Id for each USB audio device (like the cheap $2 audio USB device) plugged into the PC.) 

to list devices and the hardware or card No

aplay -l

It then creates a VLC stream for each device. 

first I install vlc with 

apt-get install vlc-nox 

Then I use crontab -e 

* * * * * /bin/bash /home/user/streamer.sh

Once the streams are running which can be checked with

ps -ef | grep vlc

They can be played back by opening vlc on another pc on the network and opening media -> open network and enter for example

http://172.16.0.100:8080

Naturally you will need to change the ip address to the ip address of the machine that is streaming the audio.

The ports will start from 8080 for the first USB and increment from there.

This solution was used on 4 audio signals that were recieved via satelite and then streamed on the local network so any user with vlc to connect to the stream.

I had problems using the integrated audio system in the PC but found the cheap USB devices worked well.  The integrated audio stream would max out the CPU over time and the stream would die.

I also found that I could not reliable know in advance what the hardware id's would be after a reboot so I needed a script that would only find USB audio devices and stream just those.

Hope some else may find this useful.  I did lots of searchuing and testing to make it happen.  But now it seems stable and works well.  

The process for each stream hovers around 15% cpu on a HP DC7700 and about 10% on a HP DC8000


