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
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8

RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
   && dpkg-reconfigure locales

# gnu screen
RUN chmod u+s /usr/bin/screen && \
    chmod 755 /var/run/screen

