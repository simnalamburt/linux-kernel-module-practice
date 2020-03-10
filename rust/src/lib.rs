#![no_std]
#![feature(core_intrinsics)]

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

/// Abort on panic
///
/// Implemented just like the [`BUG()`] macro.
///
/// [`BUG()`]: https://github.com/torvalds/linux/blob/69973b830859bc6529a7a0468ba0d80ee5117826/arch/x86/include/asm/bug.h#L30
#[panic_handler]
#[no_mangle]
extern fn panic(_info: &core::panic::PanicInfo) -> ! {
    unsafe {
        core::intrinsics::abort()
    }
}
