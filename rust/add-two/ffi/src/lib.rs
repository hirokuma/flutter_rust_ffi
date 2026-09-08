use base::add;

#[unsafe(no_mangle)]
pub extern "C" fn my_add(a: u64, b: u64) -> u64 {
    add(a, b)
}
