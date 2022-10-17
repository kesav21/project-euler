fn main() {
    let num_digits = 10000000000_i64;
    let answer = (1..=1000)
        .map(|i| {
            (0..i)
                .map(|_| i)
                .fold(1, |product, next| (product * next) % num_digits)
        })
        .fold(0_i64, |sum, next| (sum + next) % num_digits);
    println!("{}", answer)
}
