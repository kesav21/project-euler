#!/usr/bin/runghc

module EqualSplit (hasEqualSplit) where

import           Data.List (sort, sortBy, (\\))


-- library function
choose :: Int -> [a] -> [[a]]
choose 0 _      = [[]]
choose _ []     = []
choose k (x:xs) = map (x:) (choose (k-1) xs) ++ choose k xs

sortDesc :: (Ord a) => [a] -> [a]
sortDesc = sortBy (flip compare)

hasPartition :: Int -> [Int] -> Bool
hasPartition n l = hasPartition' n (sortDesc l)

hasPartition' :: Int -> [Int] -> Bool
hasPartition' _ [] = False
hasPartition' 0 _ = False
hasPartition' n l@(h:xs)
  | n `elem` l = True
  | tooSmall = False
  | otherwise = hasPartition' (n - h) xs || hasPartition' n xs
  where tooSmall = n < minimum l

hasEqualSplit' :: Int -> [Int] -> Bool
hasEqualSplit' n l = any (\x -> hasPartition (sum x) (l \\ x)) (choose n l)

hasEqualSplit :: [Int] -> Bool
hasEqualSplit l = any (True==) [hasEqualSplit' i l | i <- [2.. length l `div` 2]]


main :: IO ()
main = do

    let list = [65,75,81,84,87,88]
    -- let list = [673,465,569,603,629,592,584,300,601,599,600]
    -- let list = [36,41,54,40,25,44,42]

    print . sort $ list
    print $ hasEqualSplit list
    putStrLn ""

