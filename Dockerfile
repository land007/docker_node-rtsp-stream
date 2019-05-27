FROM land007/node-ffmpeg:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

#RUN . $HOME/.nvm/nvm.sh && cd /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/ && npm install node-rtsp-stream
#RUN ls /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/node_modules/
#ADD node_modules/node-rtsp-stream/lib/mpeg1muxer.js /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/node_modules/node-rtsp-stream/lib/mpeg1muxer.js
#RUN . $HOME/.nvm/nvm.sh && npm install node-rtsp-stream
#ADD node_modules/node-rtsp-stream/lib/mpeg1muxer.js /node_modules/node-rtsp-stream/lib/mpeg1muxer.js
ADD node_modules/ /node_/node_modules/
RUN ls /node_/node_modules/

#RUN ln -s $HOME/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/node_modules /node_
ADD node /node_
RUN ls /node_
RUN chmod +x /node_/start.sh
#ADD check.sh /
#RUN sed -i 's/\r$//' /check.sh && chmod a+x /check.sh
ENV RTSPURL=rtsp://admin:abcd1234@192.168.0.234:554/cam/realmonitor?channel=1&subtype=0
ENV WH=1280x720
ENV QUALITY=1

EXPOSE 8101/tcp 7101/tcp
RUN chmod +x /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/bin/supervisor

RUN echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_time
RUN echo "land007/node-rtsp-stream" >> /.image_name

#CMD /check.sh /node; /etc/init.d/ssh start ; cd /node && nohup http-server -a 0.0.0.0 -p 8101 > web.out 2>&1 & supervisor -w /node/ /node/main.js
RUN echo "/check.sh /node" >> /start.sh
RUN echo "cd /node && nohup http-server -a 0.0.0.0 -p 8101 > web.out 2>&1 &" >> /start.sh
RUN echo "supervisor -w /node/ /node/main.js" >> /start.sh

#docker save -o eyecool-rtsp-stream.tar registry.eyecool.cn:5080/node-rtsp-stream:latest && sudo gzip eyecool-rtsp-stream.tar && sudo chmod 777 eyecool-rtsp-stream.tar.gz

#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --restart always --privileged -p 8101:8101 -p 7101:7101 --log-opt max-size=1m --log-opt max-file=1 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/ISAPI/streaming/channels/103" -e "WH=1280x720" registry.eyecool.cn:5080/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --restart always --privileged -p 8111:8101 -p 7111:7101 --log-opt max-size=1m --log-opt max-file=1 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:abcd1234@192.168.0.234:554/cam/realmonitor?channel=1&subtype=0" -e "WH=1280x720" registry.eyecool.cn:5080/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --restart always --privileged -p 8111:8101 -p 7111:7101 --log-opt max-size=1m --log-opt max-file=1 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/ISAPI/streaming/channels/103" -e "WH=1280x720" land007/node-rtsp-stream:latest
#docker pull land007/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --restart always --privileged -p 8101:8101 -p 7101:7101 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1280x720" land007/node-rtsp-stream:latest
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
