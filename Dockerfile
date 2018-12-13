FROM land007/node-ffmpeg:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN . $HOME/.nvm/nvm.sh && cd /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/ && npm install node-rtsp-stream && npm install -g http-server
RUN ls /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/node_modules/
ADD node_modules/node-rtsp-stream/lib/mpeg1muxer.js /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/node_modules/node-rtsp-stream/lib/mpeg1muxer.js
ENV PATH $PATH:/root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/bin/
RUN which http-server

#RUN ln -s $HOME/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/node_modules /node_
ADD node /node_
RUN ls /node_
RUN chmod +x /node_/start_webserver.sh
#ADD check.sh /
#RUN sed -i 's/\r$//' /check.sh && chmod a+x /check.sh
ENV RTSPURL=rtsp://admin:abcd1234@192.168.0.234:554/cam/realmonitor?channel=1&subtype=1
ENV WH=1024x576

EXPOSE 8101/tcp 7101/tcp
ENV QUALITY=1

CMD /check.sh /node; /etc/init.d/ssh start && /node/start_webserver.sh && supervisor -w /node/ /node/main.js

#docker pull land007/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --restart always --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1024x576" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=880x660" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=890x668" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1188x668" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1188x668" land007/node-rtsp-stream:latest

#docker push registry.eyecool.cn:5080/node-rtsp-stream:latest
#docker pull registry.eyecool.cn:5080/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1188x668" registry.eyecool.cn:5080/node-rtsp-stream:latest

#shangke
#docker pull registry.eyecool.cn:5080/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:abcd1234@172.16.0.104:554" -e "WH=1188x668" registry.eyecool.cn:5080/node-rtsp-stream:latest

#shangxian
#docker pull registry.eyecool.cn:5080/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/ISAPI/streaming/channels/103" -e "WH=1280x720" -e "QUALITY=3" registry.eyecool.cn:5080/node-rtsp-stream:latest
#docker pull registry.eyecool.cn:5080/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker kill debian_node-rtsp-stream1; docker rm debian_node-rtsp-stream1; docker run -it --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream1 -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/ISAPI/streaming/channels/103" -e "WH=1280x720" -e "QUALITY=3" registry.eyecool.cn:5080/node-rtsp-stream:latest

#192.168.0.96
#Test
#docker kill debian_node-rtsp-stream_test; docker rm debian_node-rtsp-stream_test; docker run --restart always -d --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream_test -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/ISAPI/streaming/channels/103" -e "WH=1280x720" -e "QUALITY=3" registry.eyecool.cn:5080/node-rtsp-stream:latest
#Beta
#docker kill debian_node-rtsp-stream_beta; docker rm debian_node-rtsp-stream_beta; docker run --restart always -d --privileged -p 8201:8101 -p 7201:7101 --name debian_node-rtsp-stream_beta -e "RTSPURL=rtsp://admin:abcd1234@192.168.0.234:554/cam/realmonitor?channel=1&subtype=0" -e "WH=1280x720" -e "QUALITY=3" registry.eyecool.cn:5080/node-rtsp-stream:latest
#Alpha
#docker kill debian_node-rtsp-stream_alpha; docker rm debian_node-rtsp-stream_alpha; docker run --restart always -d --privileged -p 8301:8101 -p 7301:7101 --name debian_node-rtsp-stream_alpha -e "RTSPURL=rtsp://admin:admin@192.168.0.239:1554/video2" -e "WH=1280x720" -e "QUALITY=3" registry.eyecool.cn:5080/node-rtsp-stream:latest

#192.168.0.206
#Alpha
#docker kill debian_node-rtsp-stream_alpha; docker rm debian_node-rtsp-stream_alpha; docker run --restart always -d --privileged -p 8301:8101 -p 7301:7101 --name debian_node-rtsp-stream_alpha -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/ISAPI/streaming/channels/103" -e "WH=1280x720" -e "QUALITY=3" registry.eyecool.cn:5080/node-rtsp-stream:latest
