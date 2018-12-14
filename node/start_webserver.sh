#!/bin/bash
#RUN echo "/usr/bin/nohup http-server -a 0.0.0.0 -p 8000 > /node/node.out 2>&1 &" > /node/start_webserver.sh
/usr/bin/nohup http-server -a 0.0.0.0 -p 8101 > /node/node.out 2>&1 &
#node websocket-relay.js supersecret 8081 8082
#ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 -f mpegts -codec:v mpeg1video -s 640x480 -b:v 1000k -bf 0 http://localhost:8081/supersecret