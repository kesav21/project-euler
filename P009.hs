#!/usr/bin/runghc


-- this solution is based on my solution to problem 39


calcC :: Int -> Int -> Int
calcC p a = (k1 + k2) `div` 2
    where k1 = p - a
          k2 = (a * a) `div` (p - a)

calcB :: Int -> Int -> Int
calcB p a = (k1 - k2) `div` 2
    where k1 = p - a
          k2 = (a * a) `div` (p - a)

checkA :: Int -> Int -> Bool
checkA p a = (a * a) `mod` (p - a) == 0

possibleA :: Int -> [Int]
possibleA p = filter (checkA p) [1.. k]
    where k = p `div` 3 - 1


main :: IO ()
main = do

    -- returns [200]
    -- print . possibleA $ 1000

    let a = 200
        b = calcB 1000 200
        c = calcC 1000 200

    print a
    print b
    print c
    print (a*b*c)

