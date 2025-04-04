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

RISCV_PREFIX ?= riscv32-elf-

# C Compailer
CC      = $(RISCV_PREFIX)gcc
# binutils
LD      = $(RISCV_PREFIX)ld
OBJDUMP = $(RISCV_PREFIX)objdump
OBJCOPY = $(RISCV_PREFIX)objcopy
SIZE    = $(RISCV_PREFIX)size

VPATH = ../common ../

#OBJECTS = main.c  $(VPATH)/board.h  $(VPATH)/uart.h

LDS1 = ../common/user.ld
LDS2 = ../ram.ld

CC_FLAGS += -flto -Wl,--entry=0x00000800 -g -march=rv32i_zicsr_zifencei -mabi=ilp32 -Os -nostartfiles -lm -L $(LDS1) -L $(LDS2) -lc
#-Wl,--entry=_start
#-Wl,--gc-sections
CFLAGS +=  $(CC_FLAGS) -I ../common -I ../ -ffunction-sections -fdata-sections -DFLAGS_STR="\"\""

hello: main.c uart.o genraminit
	$(CC) -o hello.elf $(CFLAGS) main.c
	$(CC) -o hello.bin $(CFLAGS) main.c
#	${OBJCOPY} -O binary hello.elf hello.bin
	${OBJDUMP} -D hello.elf > disasm.S

	./genraminit hello.bin 16384 > hello.ram

	$(SIZE) hello.elf
	$(SIZE) hello.bin

uart.o: uart.c
	$(CC) -o uart.o $(CFLAGS) $^

genraminit: genraminit.c
	gcc -o $@ $^
	@echo "$(@) compiled!"

.PHONY : clean

clean:
	rm -f *.elf *.bin *.o *.S *.ram

%.o:	%.S
	${CC} -c $(CFLAGS) $< -o $@

