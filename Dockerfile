FROM land007/node:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN apt-get update && apt-get install -y ffmpeg && apt-get clean
RUN . $HOME/.nvm/nvm.sh && cd /node && npm install --save node-rtsp-stream && npm install -g http-server
RUN ls /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/node_modules/
ADD node_modules/node-rtsp-stream/lib/mpeg1muxer.js /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/node_modules/node-rtsp-stream/lib/mpeg1muxer.js
RUN which http-server
ENV PATH $PATH:/root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/bin/

ADD node /node
RUN chmod +x /node/start_webserver.sh
ADD check.sh /
RUN sed -i 's/\r$//' /check.sh
RUN chmod a+x /check.sh
RUN rm -rf /node_ && mv /node /node_
ENV RTSPURL=rtsp://admin:abcd1234@192.168.0.234:554/cam/realmonitor?channel=1&subtype=1
ENV WH=1024x576

CMD /check.sh /node ; /etc/init.d/ssh start && /node/start_webserver.sh && supervisor -w /node/ /node/main.js
EXPOSE 8000/tcp 8100/tcp

#docker pull land007/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --restart always --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1024x576" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=880x660" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=890x668" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1188x668" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1188x668" land007/node-rtsp-stream:latest
