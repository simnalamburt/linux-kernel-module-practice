#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

static int __init mymodule_init(void) {
  printk(KERN_INFO "Hello, world!\n");
  return 0;
}

static void __exit mymodule_exit(void) {
  printk(KERN_INFO "Bye, world!\n");
}

module_init(mymodule_init)
module_exit(mymodule_exit)
