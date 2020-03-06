obj-m += mymodule.o
mymodule-objs += main.o impl.o

ccflags-y := -std=gnu11 -O3 -Wextra -Wpedantic

# To disable warnings in header files
LINUXINCLUDE := $(subst -I, -isystem, $(LINUXINCLUDE))

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
