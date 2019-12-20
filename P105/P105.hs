#!/usr/bin/runghc

import           Data.List   (groupBy)

import           EqualSplit  (hasEqualSplit)
import           MinMajority (hasMinMajority)


splitByComma :: String -> [String]
splitByComma = groupBy (\a b -> b /= ',')

removeCommas :: String -> String
removeCommas (',':xs) = xs
removeCommas l        = l

parseLine :: String -> [Int]
parseLine line = map ((read::String->Int) . removeCommas) $ splitByComma line

parseFile :: String -> [[Int]]
parseFile input = map (parseLine) $ lines input

isSpecial :: [Int] -> Bool
isSpecial l = (not . hasMinMajority) l && (not . hasEqualSplit) l

sumSpecials :: [[Int]] -> Int
sumSpecials l = sum [sum i | i <- l, isSpecial i]

dispSumSpecials :: String -> String
dispSumSpecials = show . sumSpecials . parseFile


main :: IO ()
main = interact dispSumSpecials


