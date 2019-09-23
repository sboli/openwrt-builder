FROM ubuntu:19.04

ENV OPENWRT_VERSION v18.06.4

RUN apt-get -y update
RUN apt-get -y install subversion g++ zlib1g-dev build-essential \
    git python time libncurses5-dev gawk gettext unzip \
    file libssl-dev wget libelf-dev ecj fastjar java-propose-classpath sudo


RUN useradd -m builder && echo 'builder ALL=NOPASSWD: ALL' > /etc/sudoers.d/builder

USER builder

WORKDIR /home/builder

RUN git clone --branch ${OPENWRT_VERSION} https://github.com/openwrt/openwrt.git

WORKDIR /home/builder/openwrt

RUN ./scripts/feeds update -a && ./scripts/feeds install -a

RUN export TERM=xterm