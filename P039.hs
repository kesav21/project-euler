#!/usr/bin/runghc

import           Data.List (elemIndex)


checkA :: Int -> Int -> Bool
checkA p a = (a * a) `mod` (p - a) == 0

possibleA :: Int -> Int
possibleA p = length . (filter (checkA p)) $ [1.. k]
    where k = p `div` 3 - 1

maxSols :: [Int] -> Maybe Int
maxSols l = (maximum sols) `elemIndex` sols
    where sols = map (possibleA) l


main :: IO ()
main = do

    print . maxSols $ [0..1000]

