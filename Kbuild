# vim: ft=make

obj-m += mymodule.o
mymodule-objs += main.o linux_kernel_module.rust.o

ccflags-y := -std=gnu11 -Wextra -Wpedantic

# To disable warnings in header files
LINUXINCLUDE := $(subst -I, -isystem, $(LINUXINCLUDE))


$(src)/rust/target/x86_64-linux-kernel/debug/liblinux_kernel_module.a: $(src)/rust/Cargo.toml $(wildcard $(src)/rust/src/*.rs)
	cd $(src)/rust &&\
	  env -u MAKE -u MAKEFLAGS cargo +nightly build -Z build-std=core

%.rust.o: rust/target/x86_64-linux-kernel/debug/lib%.a
	$(LD) -r -o $@ --whole-archive $<
