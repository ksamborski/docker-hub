# meedan/base image

FROM ubuntu:14.04
MAINTAINER sysops@meedan.com

# no recommended or suggested packages required
RUN echo 'APT::Install-Recommends "0";'  >> /etc/apt/apt.conf.d/01norecommend \
    && echo 'APT::Install-Suggests "0";'  >> /etc/apt/apt.conf.d/01norecommend 

RUN apt-get update --fix-missing \
    && apt-get upgrade -y

# standard
RUN apt-get install -qy \
    git \
    apt-transport-https \
    ca-certificates \
    vim \
    emacs24-nox \
    screen \
    lsof \
    tree \
    htop \
    curl \
    wget \
    tig \
    smem \
    rsync \
    openssl \
    sysstat \
    software-properties-common

# locale
ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8

RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
   && dpkg-reconfigure locales

# gnu screen
RUN chmod u+s /usr/bin/screen && \
    chmod 755 /var/run/screen

# gosu
ENV GOSU_VERSION 1.9
RUN set -x \
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true
    
