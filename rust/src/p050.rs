fn primes_lt(bound: usize) -> Box<dyn Iterator<Item = usize>> {
    let mut primes: Vec<bool> = (0..=bound).map(|num| num == 2 || num & 1 != 0).collect();
    let mut num = 3usize;
    while num * num <= bound {
        let mut j = num * num;
        while j <= bound {
            primes[j] = false;
            j += num;
        }
        num += 2;
    }
    Box::new(
        primes
            .into_iter()
            .enumerate()
            .skip(2)
            .filter_map(|(i, p)| if p { Some(i) } else { None }),
    )
}

// fn max_len(primes: &[usize]) -> usize {
//     for i in 1.. {
//         if (0..i).map(|i| primes[i]).sum::<usize>() > 1_000_000 {
//             return i;
//         }
//     }
//     return 0;
// }
//
// fn solve(primes: &[usize], max_len: usize) -> usize {
//     for length in (22..max_len).rev() {
//         for i in (0..primes.len() - length).rev() {
//             let n = (i..=i + length).map(|i| primes[i]).sum::<usize>();
//             if n < 1_000_000 && primes.binary_search(&n).is_ok() {
//                 return n;
//             }
//         }
//     }
//     return 0;
// }
//
// fn main() {
//     let primes = primes_lt(1_000_000).collect::<Vec<usize>>();
//     println!("{}", solve(&primes, max_len(&primes)));
// }

fn main() {
    let primes = primes_lt(1_000_000).collect::<Vec<usize>>();
    let max_len = (1..)
        .filter(|len| (0..*len).map(|i| primes[i]).sum::<usize>() > 1_000_000)
        .next()
        .expect("failed to find max_len");
    let value = (22..max_len)
        .rev()
        .find_map(|length| {
            (0..primes.len() - length)
                .rev()
                .map(|i| (i..=i + length).map(|i| primes[i]).sum::<usize>())
                .filter(|n| n < &1_000_000)
                .filter(|n| primes.binary_search(&n).is_ok())
                .next()
        })
        .expect("failed to find value");
    println!("{}", value);
}
