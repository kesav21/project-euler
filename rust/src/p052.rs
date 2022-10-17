fn count_digits(mut n: usize) -> Vec<usize> {
    let mut counts = vec![0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    while n > 9 {
        counts[n % 10] += 1;
        n = n / 10;
    }
    counts[n] += 1;
    counts
}

// fn solve(n: usize) -> bool {
//     let first = count_digits(n);
//     for i in 2..7 {
//         let second = count_digits(i * n);
//         for j in 0..10 {
//             if first[j] != second[j] {
//                 return false;
//             }
//         }
//     }
//     return true;
// }
//
// fn main() {
//     for i in 1.. {
//         if solve(i) {
//             println!("{}", i);
//             break;
//         }
//     }
// }

fn main() {
    let answer = (1..)
        .filter(|n| {
            let first = count_digits(*n);
            (2..7)
                .map(|i| i * n)
                .map(count_digits)
                .all(|second| (0..10).all(|j| first[j] == second[j]))
        })
        .next();
    println!("{:?}", answer);
}

// answer is 142857
// also, this can be solved without a computer, 1/7 = 0.142857 142857 142857 ...
