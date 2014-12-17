# Ubuntu Maestrano base image

FROM ubuntu:14.04
MAINTAINER Cesar Tonnoir <it@maestrano.com>

RUN apt-get update && apt-get install -y \
	git \
	curl

RUN	curl -L https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.5-1_amd64.deb \
		-o chef.deb && \
	dpkg -i chef.deb && \
	rm chef.deb

VOLUME ["/storage"]

RUN mkdir -p /app/src && \
	mkdir -p /app/src_runtime && \
	mkdir -p /meta && \
	mkdir -p /mno/scripts && \
	mkdir -p /mno/chef/cache && \
	mkdir -p /var/log/chef

CMD ["/bin/bash"]