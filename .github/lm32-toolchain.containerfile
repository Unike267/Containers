# Author:
#   Unai Sainz-Estebanez
# Email:
#  <unai.sainze@ehu.eus>
#
# Licensed under the GNU General Public License v3.0;
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.gnu.org/licenses/gpl-3.0.html

# LM32 cross compiling tool

MAINTAINER <unike267@gmail.com>

FROM ubuntu:latest AS download

ARG GCC_VER="4.5.3"

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    ca-certificates \
    curl \
 && curl -L -o gcc-$GCC_VER.tar.gz  http://ftp.gnu.org/gnu/gcc/gcc-$GCC_VER/gcc-$GCC_VER.tar.gz \
 && curl -L -o lm32.tar.xz https://ohwr.org/project/wr-cores/uploads/a2e8eeba448fbc8d580e68004e6f6c7f/lm32.tar.xz \
 && mkdir mount \
 && mv gcc-$GCC_VER.tar.gz mount \
 && mv lm32.tar.xz mount 

FROM debian:6.0 AS base

ARG GCC_VER="4.5.3"

RUN echo > /etc/apt/sources.list \
 && sed -i '1s|^|deb http://archive.debian.org/debian/ squeeze main contrib non-free|' /etc/apt/sources.list \
 && sed -i '$a\deb-src http://archive.debian.org/debian/ squeeze main contrib non-free' /etc/apt/sources.list \
 && sed -i '$a\ ' /etc/apt/sources.list \
 && sed -i '$a\deb http://archive.debian.org/debian squeeze-lts main contrib non-free' /etc/apt/sources.list \
 && sed -i '$a\deb-src http://archive.debian.org/debian squeeze-lts main contrib non-free' /etc/apt/sources.list \
# && keys=($(apt-key list | grep expired | cut -f4 --delimiter=' ' | cut -f2 --delimiter=/)) \
# && for i in "${keys[@]}"; do apt-key adv --recv-keys --keyserver keyserver.ubuntu.com $i; done \
 && apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install --no-install-recommends \
    ca-certificates \
    cmake \
    g++ \
    git \
    gnupg \
    libc6-dev-i386 \
    libc6-i386 \
    libgmp3-dev \
    libmpc-dev \
    libmpfr-dev \
    libreadline-dev \
    linux-libc-dev \
    lsb-release \
    make \
    wget \
    xz-utils \
    zlib1g-dev \
 && apt-get autoclean && apt-get clean && apt-get -y autoremove \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Install GCC 
RUN --mount=type=cache,from=download,src=/mount,target=/opt \
    tar xzvf /opt/gcc-$GCC_VER.tar.gz -C . --no-same-owner --no-same-permissions \
 && cd gcc-$GCC_VER \
 && ./configure -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --prefix=/usr/bin/gcc-$GCC_VER --enable-checking=release --enable-languages=c,c++ --disable-multilib --program-suffix=-gcc-$GCC_VER \
 && make -j$(nproc) \
 && make install \
 && gcc --version 

FROM base AS build

ENV CROSS_COMPILE /opt/lm32/bin/lm32-elf-
ENV PATH $PATH:/opt/lm32/bin

RUN --mount=type=cache,from=download,src=/mount,target=/tmp \
    tar xvf /tmp/lm32.tar.xz -C /opt --no-same-owner --no-same-permissions 
