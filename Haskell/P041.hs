#!/usr/bin/runghc

import           Data.List (permutations)


nDigitPans :: Int -> [Int]
nDigitPans n = (map (read::String->Int)) . permutations . concat . (map (show)) $ [1..n]

allPans :: [Int]
allPans = concat . (map (nDigitPans)) $ [1..9]

isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

factors :: Int -> [Int]
factors n = [i | i <- [2..isqrt n], n `mod` i == 0]

isPrime :: Int -> Bool
isPrime = ([]==) . factors

maxPrime :: [Int] -> Int
maxPrime = maximum . (filter (isPrime))


main :: IO ()
main = do

    print . maxPrime $ allPans

