# Reference:
#   https://www.kernel.org/doc/Documentation/kbuild/modules.txt
#   https://www.kernel.org/doc/Documentation/kbuild/makefiles.txt

obj-m += mymodule.o
mymodule-objs += main.o linux_kernel_module.rust.o

ccflags-y := -std=gnu11 -Wextra -Wpedantic

# To disable warnings in header files
LINUXINCLUDE := $(subst -I, -isystem, $(LINUXINCLUDE))

#
# Basic rules
#
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

#
# Rules for Rust codes
#
$(src)/rust/target/x86_64-linux-kernel/debug/liblinux_kernel_module.a: $(src)/rust/Cargo.toml $(wildcard $(src)/rust/src/*.rs)
	cd $(src)/rust &&\
	  env -u MAKE -u MAKEFLAGS cargo +nightly build -Z build-std=core

%.rust.o: rust/target/x86_64-linux-kernel/debug/lib%.a
	$(LD) -r -o $@ --whole-archive $<
