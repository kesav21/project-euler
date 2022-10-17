use num_traits::PrimInt;

struct PrimIntWrapper<T: PrimInt>(Vec<T>);

impl<T: PrimInt> Iterator for PrimIntWrapper<T> {
    type Item = T;
    fn next(&mut self) -> Option<Self::Item> {
        self.0.pop()
    }
}

impl<T: PrimInt> DoubleEndedIterator for PrimIntWrapper<T> {
    fn next_back(&mut self) -> Option<Self::Item> {
        if self.0.is_empty() {
            None
        } else {
            Some(self.0.remove(0))
        }
    }
}

pub trait PrimIntIter<T: PrimInt> {
    fn iter(self) -> Box<dyn DoubleEndedIterator<Item = T>>;
}

impl<T: 'static + PrimInt> PrimIntIter<T> for T {
    fn iter(self) -> Box<dyn DoubleEndedIterator<Item = T>> {
        let ten = T::one()
            + T::one()
            + T::one()
            + T::one()
            + T::one()
            + T::one()
            + T::one()
            + T::one()
            + T::one()
            + T::one();
        let mut digits = Vec::new();
        let mut n = self;
        while n >= ten {
            digits.push(n % ten);
            n = n / ten;
        }
        digits.push(n);
        Box::new(PrimIntWrapper(digits))
    }
}
