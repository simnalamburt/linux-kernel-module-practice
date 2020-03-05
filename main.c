#include <linux/module.h>
#include "impl.h"

static int __init mymodule_init(void) {
  return init_impl();
}

static void __exit mymodule_exit(void) {
  exit_impl();
}

module_init(mymodule_init)
module_exit(mymodule_exit)
