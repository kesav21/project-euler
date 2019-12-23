#!/usr/bin/runghc


module Tools where


-- integer square root (rounds down)
isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

factors :: Int -> [Int]
factors n = [i | i <- [2..isqrt n], n `mod` i == 0]


main :: IO ()
main = do
    print 10

