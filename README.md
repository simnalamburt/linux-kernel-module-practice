Linux Kernel Module Practice
========

### Requirements
- x86_64 CPU
- Linux 4.9.0

```
# Build
sudo apt-get install make linux-headers-4.9.0-12-amd64
make

# Load & unload the module, check `dmesg`
sudo insmod mymodule.ko
sudo rmmod mymodule

# Clean
make clean
```

&nbsp;

--------

*linux-kernel-module-practice* is distributed under the terms of the [GNU
General Public License v2.0] or any later version. See [COPYRIGHT] for details.

[GNU General Public License v2.0]: LICENSE
[COPYRIGHT]: COPYRIGHT
