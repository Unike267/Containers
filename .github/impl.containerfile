FROM ghcr.io/hdl/impl/icestorm


RUN apt-get update -qq \
&& apt-get install -y git \
&& apt install -y python3 python3-pip python3-yaml cmake\
&& apt install -y cython3 

# Clone prjxray repository and build
RUN git clone --recursive https://github.com/SymbiFlow/prjxray.git \
&& cd prjxray \
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

