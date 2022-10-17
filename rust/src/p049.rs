use itertools::Itertools;

fn primes_lt(bound: usize) -> impl Iterator<Item = usize> {
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
    primes
        .into_iter()
        .enumerate()
        .skip(2)
        .filter_map(|(i, p)| if p { Some(i) } else { None })
}

fn number_to_vec(n: usize) -> Vec<usize> {
    let mut digits = Vec::new();
    let mut n = n;
    while n > 9 {
        digits.push(n % 10);
        n = n / 10;
    }
    digits.push(n);
    digits.reverse();
    digits
}

fn main() {
    let primes = primes_lt(10000)
        .filter(|i| *i > 1000)
        .collect::<Vec<usize>>();

    primes
        .iter()
        .map(|prime| {
            number_to_vec(*prime)
                .iter()
                .permutations(4)
                .unique()
                .map(|i| i.iter().fold(0, |acc, elem| acc * 10 + **elem))
                .filter(|i| primes.binary_search(i).is_ok())
                .sorted()
                .collect::<Vec<usize>>()
        })
        .filter_map(|p| {
            (0..p.len()).find_map(|i| {
                (i + 1..p.len()).find_map(|j| {
                    (j + 1..p.len())
                        .map(|k| (p[i], p[j], p[k]))
                        .find(|(pi, pj, pk)| pj - pi == pk - pj)
                })
            })
        })
        .for_each(|(pi, pj, pk)| println!("{} {} {}", pi, pj, pk));

    // for prime in &primes {
    //     let permutations = number_to_vec(*prime)
    //         .iter()
    //         .permutations(4)
    //         .unique()
    //         .map(|i| i.iter().fold(0, |acc, elem| acc * 10 + **elem))
    //         .filter(|i| primes.binary_search(i).is_ok())
    //         .sorted()
    //         .collect::<Vec<usize>>();
    //     for i in 0..permutations.len() {
    //         for j in i + 1..permutations.len() {
    //             for k in j + 1..permutations.len() {
    //                 if permutations[j] - permutations[i] == permutations[k] - permutations[j] {
    //                     println!(
    //                         "{} {} {}",
    //                         permutations[i], permutations[j], permutations[k]
    //                     );
    //                 }
    //             }
    //         }
    //     }
    // }

    //
}
