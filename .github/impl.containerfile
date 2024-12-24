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

FROM ghcr.io/hdl/impl/icestorm

MAINTAINER <unike267@gmail.com>

RUN apt-get update -qq \
&& apt-get install -y git python3 python3-pip python3-yaml cmake cython3 lsb-release wget software-properties-common gnupg

# Clone prjxray repository and build
RUN git clone --recursive https://github.com/SymbiFlow/prjxray.git \
# According to SGSSGene's proposal (see jbeder/yaml-cpp/issues/1334), to solve the issue f4pga/prjxray/issues/2472 clang must be updated, in this case from 11 to 14
&& apt-get purge -y clang-11 \
&& curl -L -o llvm.sh https://apt.llvm.org/llvm.sh \
&& chmod +x llvm.sh \
&& ./llvm.sh 14 \
&& cd /usr/lib/llvm-14/bin \
&& for f in *; do rm -f /usr/bin/$f; ln -s ../lib/llvm-14/bin/$f /usr/bin/$f; done \
&& clang --version \
&& cd ../../../../prjxray \
&& make ALLOW_ROOT=1 build \
&& python3 setup.py install \
&& cd third_party/fasm \
&& python3 setup.py install \
&& cd ../.. \
&& ./download-latest-db.sh \
&& mkdir -p /usr/local/share/nextpnr \
&& cp -r database /usr/local/share/nextpnr/prjxray-db \
&& cd .. 

# Clone nextpnr-xilinx repository, build and install
RUN apt-get install -y libeigen3-dev \
&& git clone --recursive https://github.com/gatecat/nextpnr-xilinx.git \
&& cd nextpnr-xilinx \
&& mkdir build \
&& cd build \
&& cmake ../ -DARCH=xilinx -DBUILD_GUI=OFF -DBUILD_PYTHON=OFF \
&& make \
&& make install \
&& cd .. \
# Generate the chipdb for arty 35t
&& python3 xilinx/python/bbaexport.py --device xc7a35tcsg324-1 --bba xilinx/xc7a35t.bba \
&& ./build/bba/bbasm --l xilinx/xc7a35t.bba xilinx/xc7a35t.bin \
&& mkdir -p /usr/local/share/nextpnr/xilinx-chipdb \
&& cp xilinx/xc7a35t.bin /usr/local/share/nextpnr/xilinx-chipdb/ \
# Generate the chipdb for arty 100t
&& python3 xilinx/python/bbaexport.py --device xc7a100tcsg324-1 --bba xilinx/xc7a100t.bba \
&& ./build/bba/bbasm --l xilinx/xc7a100t.bba xilinx/xc7a100t.bin \
&& cp xilinx/xc7a100t.bin /usr/local/share/nextpnr/xilinx-chipdb/ 
