#!/usr/bin/runghc

module P041 where

import           Data.List (permutations)


nDigitPans :: Int -> [Int]
nDigitPans n = (map (read::String->Int)) . permutations . concat . (map (show)) $ [1..n]

--
-- thanks to gamma in the thread:
-- 2,3,5,6,8,9 digit pandigitals do not need to be checked
-- 1+2=3 => always divisible by 3
-- 1+2+3=6 => always divisible by 3
-- 1+2+3+4+5=15 => always divisible by 3
-- 1+2+3+4+5+6=21 => always divisible by 3
-- 1+2+3+4+5+6+7+8=36 => always divisible by 3
-- 1+2+3+4+5+6+7+8+9=45 => always divisible by 3
-- that leaves 4 and 7
--
allPans :: [Int]
allPans = concat . (map (nDigitPans)) $ [4,7]

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

