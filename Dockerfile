FROM 		mono:latest

MAINTAINER 	JC Snider, <jcsnider3@gmail.com>

USER        root
RUN 		apt-get update &&  apt-get upgrade &&  apt-get install --no-cache --update sqlite-libs curl ca-certificates openssl git tar bash && adduser -D -h /home/container container

COPY        ./entrypoint.sh /entrypoint.sh
COPY        ./startup-script.sh /startup-script.sh
RUN 		["chmod", "+x", "/startup-script.sh"]

USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

CMD         ["/bin/bash", "/entrypoint.sh"]
