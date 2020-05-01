#!/usr/bin/runghc

import Data.List


portion :: Int -> Int -> Int
portion k n = (n `div` (10 ^ (7 - k))) `mod` 1000

isDiv :: Int -> Int -> Bool
isDiv k n = 0 == n `mod` k

hasProperty :: Int -> Bool
hasProperty n = has 2 1 n && has 3 2 n && has 5 3 n && has 7 4 n && has 11 5 n && has 13 6 n && has 17 7 n
    where has a b = isDiv a . portion b

sumValidPans :: Int
sumValidPans = sum . filter hasProperty . map toInt . permutations $ "1234567890"
    where toInt = read::String->Int


main :: IO ()
main = print sumValidPans

