# Ubuntu Maestrano base image

FROM ubuntu:14.04
MAINTAINER Cesar Tonnoir <it@maestrano.com>

RUN apt-get update && apt-get install -y \
	git \
	curl

RUN	curl https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.5-1_amd64.deb -o chef.deb && dpkg -i chef.deb && rm chef.deb

VOLUME ["/storage"]

RUN mkdir /app && \
	mkdir /meta && \
	mkdir /mno && \
	mkdir /mno/scripts && \
	mkdir /mno/chef && \
	mkdir /mno/chef/cache && \
	mkdir /var/log/chef

CMD ["/bin/bash"]