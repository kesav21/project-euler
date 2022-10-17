use std::collections::HashSet;

// fn factors(number: i32) -> impl Iterator<Item = i32> {
//     let sqrt = (number as f32).sqrt() as i32;
//     (2..=sqrt)
//         .filter(move |i| number == number / i * i)
//         .flat_map(move |i| [i, number / i])
// }

fn is_prime(number: i32) -> bool {
    if number < 2 {
        false
    } else {
        let sqrt = (number as f32).sqrt() as i32;
        !(2..=sqrt).any(move |i| number % i == 0)
    }
}

fn prime_factors(number: i32) -> impl Iterator<Item = i32> {
    let sqrt = (number as f32).sqrt() as i32;
    (2..=sqrt)
        .filter(move |i| number == number / i * i)
        .flat_map(move |i| [i, number / i])
        .filter(|i| is_prime(*i))
}

fn main() {
    for i in 0.. {
        let k1 = prime_factors(i).collect::<HashSet<_>>();
        let k2 = prime_factors(i + 1).collect::<HashSet<_>>();
        let k3 = prime_factors(i + 2).collect::<HashSet<_>>();
        let k4 = prime_factors(i + 3).collect::<HashSet<_>>();
        if k1.len() == 4 && k2.len() == 4 && k3.len() == 4 && k4.len() == 4 {
            let are_distinct = k1
                .intersection(&k2)
                .copied()
                .collect::<HashSet<_>>()
                .intersection(&k3)
                .copied()
                .collect::<HashSet<_>>()
                .intersection(&k4)
                .fold(true, |_, _| false);
            if are_distinct {
                println!("{}/{}/{}/{}", i, i + 1, i + 2, i + 3);
                break;
            }
        }
    }
}
