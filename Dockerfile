FROM 		mono:6.10.0.104
MAINTAINER 	JC Snider, <jcsnider3@gmail.com>

USER        root
RUN 		apt-get update &&  apt-get upgrade &&  apt-get install -y sqlite3 libsqlite3-dev curl ca-certificates openssl git tar bash wget unzip && adduser -D -h /home/container container

COPY        ./entrypoint.sh /entrypoint.sh
COPY        ./startup-script.sh /startup-script.sh
RUN 		["chmod", "+x", "/startup-script.sh"]

USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

CMD         ["/bin/bash", "/entrypoint.sh"]
