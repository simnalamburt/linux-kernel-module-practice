obj-m += mymodule.o
ccflags-y := -std=gnu11 -O3

# Enable strict compiler warnings, excluding header files
ccflags-y += -Wextra -Wpedantic
LINUXINCLUDE := $(subst -I, -isystem, $(LINUXINCLUDE))

all:
	  make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	  make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
