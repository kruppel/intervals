fn main() {
    let arg: u32 = ::std::env::args().nth(1).unwrap().parse().unwrap();
    let mut sum = 0;

    for i in 1..arg {
        if i % 3 == 0 || i % 5 == 0 {
            sum += i;
        }
    }

    println!("{}", sum);
}
