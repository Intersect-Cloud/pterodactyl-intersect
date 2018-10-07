FROM 		quay.io/pterodactyl/core:mono

MAINTAINER 	JC Snider, <jcsnider3@gmail.com>

USER        root
RUN 		apk update &&  apk upgrade &&  apk add --no-cache --update sqlite-libs curl ca-certificates openssl git tar bash

COPY        ./startup-script.sh /startup-script.sh
RUN 		["chmod", "+x", "/startup-script.sh"]

USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

CMD         ["/bin/bash", "/entrypoint.sh"]
