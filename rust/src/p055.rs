// use num_traits::PrimInt;

// struct PrimIntIter<T: PrimInt> {
//     value: Option<T>,
//     ten: T,
// }
//
// impl<T: PrimInt> From<T> for PrimIntIter<T> {
//     fn from(t: T) -> Self {
//         Self {
//             value: Some(t),
//             ten: T::one()
//                 + T::one()
//                 + T::one()
//                 + T::one()
//                 + T::one()
//                 + T::one()
//                 + T::one()
//                 + T::one()
//                 + T::one()
//                 + T::one(),
//         }
//     }
// }
//
// impl<T: PrimInt> Iterator for PrimIntIter<T> {
//     type Item = T;
//     fn next(&mut self) -> Option<Self::Item> {
//         if let Some(n) = self.value.as_mut() {
//             let q = n.div(self.ten);
//             let r = n.rem(self.ten);
//             self.value = if q.is_zero() { None } else { Some(q) };
//             Some(r)
//         } else {
//             None
//         }
//     }
// }

// struct PrimIntIter<T: PrimInt>(Vec<T>);
//
// impl<T: PrimInt> Iterator for PrimIntIter<T> {
//     type Item = T;
//     fn next(&mut self) -> Option<Self::Item> {
//         if self.0.is_empty() {
//             return None;
//         }
//         self.0.pop()
//     }
// }
//
// impl<T: PrimInt> DoubleEndedIterator for PrimIntIter<T> {
//     fn next_back(&mut self) -> Option<Self::Item> {
//         if self.0.is_empty() {
//             return None;
//         }
//         Some(self.0.remove(0))
//     }
// }
//
// trait Iter<T: PrimInt> {
//     fn iter(self) -> Box<dyn DoubleEndedIterator<Item = T>>;
// }
//
// impl<T: 'static + PrimInt> Iter<T> for T {
//     fn iter(self) -> Box<dyn DoubleEndedIterator<Item = T>> {
//         let ten = T::one()
//             + T::one()
//             + T::one()
//             + T::one()
//             + T::one()
//             + T::one()
//             + T::one()
//             + T::one()
//             + T::one()
//             + T::one();
//         let mut digits = Vec::new();
//         let mut n = self;
//         while n >= ten {
//             digits.push(n % ten);
//             n = n / ten;
//         }
//         digits.push(n);
//         Box::new(PrimIntIter(digits))
//     }
// }

use lib::PrimIntIter;

// TODO: is there a way to implement IntoIterator for x?
fn main() {
    let x = 47;
    println!("{}", x);
    x.iter().for_each(|i| print!("{} ", i));
    println!("");
    x.iter().rev().for_each(|i| print!("{} ", i));

    println!("");
    for digit in x.iter() {
        print!("{} ", digit);
    }
    println!("");

    println!("");
    for digit in x.iter().rev() {
        print!("{} ", digit);
    }
    println!("");

    // let v = vec![1, 2, 3];
    // for digit in v {
    //     print!("{} ", digit);
    // }
    // println!("");

    // let k = 47;
    // IntegerIter::from(k).for_each(|i| println!("{:?}", i));
    // println!("{:?}", k);
    // IntegerIter::from(10).for_each(|i| println!("{:?}", i));
}

// fn reverse_number(n: usize) -> usize {
//     let mut digits = Vec::new();
//     let mut n = n;
//     while n > 9 {
//         digits.push(n % 10);
//         n = n / 10;
//     }
//     digits.push(n);
//     digits.iter().fold(0, |acc, elem| acc * 10 + *elem)
// }
//
// fn is_palindrome(n: usize) -> bool {
//     let mut digits = Vec::new();
//     let mut n = n;
//     while n > 9 {
//         digits.push(n % 10);
//         n = n / 10;
//     }
//     digits.push(n);
//     (0..digits.len() / 2).all(|i| digits[i] == digits[digits.len() - i - 1])
// }
//
// fn main() {
//     let k = is_palindrome(47 + reverse_number(47));
//
//     println!("{}", k);
//     println!("{}", is_palindrome(47));
//     println!("{}", is_palindrome(74));
//     println!("{}", is_palindrome(121));
//     println!("{}", is_palindrome(7337));
//
//     for i in 0..10_000 {
//         // reverse the number
//         // add it to the original
//         // if palindromic, done
//         // else, repeat a total of 49 times
//         println!("{}", i);
//     }
//
//     //
// }
