AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OC = arm-none-eabi-objcopy

FIRMS = 17412 17455 17498 17552 17567
ROPS = $(addprefix rop/rop_, $(FIRMS))
BINS = $(addsuffix .bin, $(ROPS))
ELFS = $(addsuffix .elf, $(ROPS))
OBJS = rop/slide.o $(addsuffix .o, $(addprefix rop/symbols/sym_, $(FIRMS)))

all: spider.html

spider.html: mkhtml $(BINS)
	./mkhtml $(BINS) > $@

mkhtml: mkhtml.c
	$(CC) $< -o $@

%.bin: %.elf
	$(OC) -S -O binary $< $@

rop/rop_%.elf: rop/slide.o rop/symbols/sym_%.o
	$(LD) -T rop/linker.x $^ -o $@

clean:
	rm -f spider.html mkhtml $(BINS) $(ELFS) $(OBJS)
