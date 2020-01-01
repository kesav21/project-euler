#!/usr/bin/runghc

import           P041 (isPrime, isqrt)


isSquare :: Int -> Bool
isSquare n = r * r == n
    where r = isqrt n

isSuitable :: Int -> Bool
isSuitable n
  | n `mod` 2 /= 0 = False
  | otherwise = isSquare (n `div` 2)

doesSatisfy :: Int -> Bool
doesSatisfy n = (any (isSuitable)) . (map (subtract n)) . primes $ n
    where primes n = filter (isPrime) [1..n]
          subtract n i = n - i

oddComposites :: [Int]
oddComposites = filter (not . isPrime) [1,3..]


main :: IO ()
main = do
    print . head . (filter (not . doesSatisfy)) $ oddComposites

