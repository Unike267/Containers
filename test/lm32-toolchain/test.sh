#!/usr/bin/env bash

set -ex

cd $(dirname "$0")

cd wrpc-sw

make cute_a7_defconfig

make

mv wrc.vhd  ../../..
mv wrc.bin  ../../..
mv wrc.elf  ../../..
mv wrc.bram ../../..
