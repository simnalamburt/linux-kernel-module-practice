#include <linux/module.h>
#include "impl.h"

MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("Hyeon Kim <simnalamburt@gmail.com>");
MODULE_DESCRIPTION("PoC of Linux kernel module written in Rust");

static int __init mymodule_init(void) {
  return init_impl();
}

static void __exit mymodule_exit(void) {
  exit_impl();
}

module_init(mymodule_init)
module_exit(mymodule_exit)
