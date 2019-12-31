#!/usr/bin/runghc

module P044 where

import           P041 (isqrt)


pentagonal :: Int -> Int
pentagonal n = (n * (3 * n - 1)) `div` 2

root :: Int -> Int
root k = (1 + isqrt (1 + 24 * k)) `div` 6

isPentagonal :: Int -> Bool
isPentagonal k = r * (3 * r - 1) == 2 * k
    where r = root k

hasDk :: Int -> Bool
hasDk i = any (isValid) [1..300]
    where pi = pentagonal i
          pik dk = pentagonal (i + dk)
          pil dk = 2 * pik dk - pi
          pij dk = pik dk - pi
          isValid dk = (isPentagonal . pil) dk && (isPentagonal . pij) dk


main :: IO ()
main = do

    -- j, i, k, l = 1020, 1912, 2167, 2395
    print . pentagonal . head . (filter (hasDk)) $ [1..]


