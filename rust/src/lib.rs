#![no_std]

extern {
    #[cold]
    fn printk(fmt: *const u8, ...) -> i32;
}

#[no_mangle]
pub extern fn init_impl() -> i32 {
    unsafe {
        printk(b"\x016mymodule: Hello, Rust!\n\0".as_ptr());
    }
    0
}

#[no_mangle]
pub extern fn exit_impl() {
    unsafe {
        printk(b"\x016mymodule: Bye, Rust!\n\0".as_ptr());
    }
}

/// Infinite loop on panic
///
/// TODO: Must find a better way to abort, like `BUG()`
#[panic_handler]
#[no_mangle]
extern fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop { }
}
