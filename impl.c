//
// Headers
//
__attribute__((format(printf, 1, 2)))
__attribute__((__cold__))
int32_t printk(const char *fmt, ...);

//
// Implementation
//

int32_t init_impl(void) {
  printk("\0016Hello, base C!\n");
  return 0;
}

void exit_impl(void) {
  printk("\0016Bye, base C!\n");
}
