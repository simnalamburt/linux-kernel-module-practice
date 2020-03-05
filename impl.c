#include <linux/module.h>

int init_impl(void) {
  printk(KERN_INFO "Hello, world!\n");
  return 0;
}

void exit_impl(void) {
  printk(KERN_INFO "Bye, world!\n");
}
