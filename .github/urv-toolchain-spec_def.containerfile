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

FROM ubuntu:latest

MAINTAINER <unike267@gmail.com>

RUN apt-get update -qq \
&& apt-get install -y build-essential \
&& apt-get install -y libreadline-dev \
&& apt-get install -y curl \
&& apt-get install -y xz-utils \
&& apt-get install -y make \
&& apt-get install -y libseccomp-dev \
&& curl -L -o riscv-11.2-small.tgz https://ohwr.org/project/wrpc-sw/wikis/uploads/9f9224d2249848ed3e854636de9c08dc/riscv-11.2-small.tgz \
&& tar xzvf riscv-11.2-small.tgz -C . --no-same-owner --no-overwrite-dir\
&& export CROSS_COMPILE="/riscv-11.2-small/bin/riscv32-elf-" \
&& apt-get install -y git \
&& git clone --recursive https://ohwr.org/project/wrpc-sw \
&& cd wrpc-sw \
&& git checkout wrpc-v5 \
&& make spec_defconfig \
&& make

