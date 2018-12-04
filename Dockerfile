FROM land007/node:latest

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

CMD /check.sh /node ; /etc/init.d/ssh start && /node/start_webserver.sh && supervisor -w /node/ /node/main.js
EXPOSE 8000/tcp 8100/tcp

#docker pull land007/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --restart always --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1024x576" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=880x660" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=890x668" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1188x668" land007/node-rtsp-stream:latest
#docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1188x668" land007/node-rtsp-stream:latest

#docker push registry.eyecool.cn:5080/node-rtsp-stream:latest
#docker pull registry.eyecool.cn:5080/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:Admin123@192.168.0.241:554/h264/ch1/sub/av_stream" -e "WH=1188x668" registry.eyecool.cn:5080/node-rtsp-stream:latest

#shangke
#docker pull registry.eyecool.cn:5080/node-rtsp-stream:latest; docker kill debian_node-rtsp-stream; docker rm debian_node-rtsp-stream; docker run -it --privileged -p 8000:8000 -p 8100:8100 --name debian_node-rtsp-stream -e "RTSPURL=rtsp://admin:abcd1234@172.16.0.104:554" -e "WH=1188x668" registry.eyecool.cn:5080/node-rtsp-stream:latest
