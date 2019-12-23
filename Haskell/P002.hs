#!/usr/bin/runghc

-- a re-implementation of problem 2

import           Data.Function (fix)


fib :: (Int -> Int) -> Int -> Int
fib f 0 = 1
fib f 1 = 1
fib f n = f (n - 1) + f (n - 2)

memoize :: (Int -> a) -> (Int -> a)
memoize f = (map f [0 ..] !!)

fibMemo :: Int -> Int
fibMemo = fix (memoize . fib)

sumFib :: Int -> Int
sumFib n = sum (takeWhile (<n) (map (fibMemo) [2,5..]))


main :: IO ()
main = do

    print $ sumFib 4000000

