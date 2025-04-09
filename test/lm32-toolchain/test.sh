#!/usr/bin/env bash

set -ex

cd $(dirname "$0")

make cute_a7_defconfig

make

mv wrc.bin  ../../..
mv wrc.elf  ../../..
mv wrc.bram ../../..
