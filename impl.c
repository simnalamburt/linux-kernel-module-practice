//
// Headers
//
__attribute__((format(printf, 1, 2)))
__attribute__((__cold__))
int printk(const char *fmt, ...);

//
// Implementation
//

int init_impl(void) {
  printk("\0016Hello, base C!\n");
  return 0;
}

void exit_impl(void) {
  printk("\0016Bye, base C!\n");
}
