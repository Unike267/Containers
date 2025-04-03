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

# urv cross compiling tool

MAINTAINER <unike267@gmail.com>

FROM ubuntu:latest AS download

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    ca-certificates \
    curl \
 && curl -L -o riscv-11.2-small.tgz https://ohwr.org/project/wrpc-sw/wikis/uploads/9f9224d2249848ed3e854636de9c08dc/riscv-11.2-small.tgz \
 && mkdir mount \
 && mv riscv-11.2-small.tgz mount 

FROM ubuntu:latest AS base

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    ca-certificates \
    g++ \
    git \
    libisl-dev \
    libmpc-dev \
    libreadline-dev \
    libudev-dev \
    make \
    xz-utils \
    zlib1g-dev \
    zstd \
 && apt-get autoclean && apt-get clean && apt-get -y autoremove \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/*

FROM base AS build

ENV CROSS_COMPILE /opt/riscv-11.2-small/bin/riscv32-elf-
ENV PATH $PATH:/opt/riscv-11.2-small/bin

RUN --mount=type=cache,from=download,src=/mount,target=/tmp \
    tar xvf /tmp/riscv-11.2-small.tgz -C /opt --no-same-owner --no-same-permissions 
