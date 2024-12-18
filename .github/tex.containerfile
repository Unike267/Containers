FROM docker.io/btdi/latex

RUN apt-get update -qq \
&& apt-get install -y python3-pip \
&& pip3 install Pygments


