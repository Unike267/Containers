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

MAINTAINER <unike267@gmail.com>

FROM docker.io/btdi/latex AS base

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    ca-certificates \
    python3-pip \
    python3-venv \
 && apt-get autoclean && apt-get clean && apt-get -y autoremove \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/* 

FROM base AS build

ENV VIRTUAL_ENV=/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python3 -m venv $VIRTUAL_ENV

RUN pip3 install -U Pygments \
 && rm -rf ~/.cache 
