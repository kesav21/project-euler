use num::BigUint;

fn main() {
    let mut factorial: Vec<BigUint> = vec![BigUint::new(vec![0]); 101];
    factorial[0] = BigUint::new(vec![1]);
    for i in 1..101 {
        factorial[i] = i * &factorial[i - 1];
    }

    let million = BigUint::from(1_000_000 as usize);

    let answer: usize = (23..101)
        .map(|n| {
            (0..n + 1)
                .map(|r| &factorial[n] / (&factorial[r] * &factorial[n - r]))
                .filter(|i| i > &million)
                .count()
        })
        .sum();
    println!("{}", answer);
}
