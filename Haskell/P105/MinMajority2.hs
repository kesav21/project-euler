#!/usr/bin/runghc

module MinMajority2 (hasMinMajority) where

import           Data.List (sort, sortBy)


-- my method

sortDesc :: (Ord a) => [a] -> [a]
sortDesc = sortBy (flip compare)

hasMinMajority :: [Int] -> Bool
hasMinMajority l = hasMinMajority' 0 $ sort l

hasMinMajority' :: Int -> [Int] -> Bool
hasMinMajority' s l
  | isShort = False
  | s1 >= 0 = True
  | otherwise = hasMinMajority' s1 l1
  where s1 = specialSum s l
        l1 = shorten s l
        isShort = tooShort s l

tooShort :: Int -> [Int] -> Bool
tooShort s l
  | s == 0 = len < 3
  | otherwise = len < 2
  where len = length l

specialSum :: Int -> [Int] -> Int
specialSum s l
  | s == 0 = last l - head l - l !! 1
  | otherwise = s + last l - head l

shorten :: Int -> [Int] -> [Int]
shorten s
  | s == 0 = tail . tail . init
  | otherwise = tail . init


main :: IO ()
main = do

    -- let list = [42,65,75,81,84,86,87,88]
    -- print . sortDesc $ list
    -- print . hasMinMajority $ list

    -- let list = [42,65,75,81,84,86,87,88+19]
    -- print . sortDesc $ list
    -- print . hasMinMajority $ list

    -- let list = [42,65,75,81,84,86,87,88+7]
    -- print . sortDesc $ list
    -- print . hasMinMajority $ list

    -- let list = [42,65,75,81,84,86,87,88+3]
    -- print . sortDesc $ list
    -- print . hasMinMajority $ list

    -- let list = [1,2,3,6]
    -- print . sortDesc $ list
    -- print . hasMinMajority $ list

    let list = [348,329,343,344,338,315,169,359,375,271]
    -- let list = [343,266,344,172,308,336,364,350,359,333]
    -- let list = [644,695,691,679,667,687,340,681,770,686,517]

    print . sortDesc $ list
    print . hasMinMajority $ list
