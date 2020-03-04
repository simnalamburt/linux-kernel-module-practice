Linux Kernel Module Practice
========

### Requirements
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
