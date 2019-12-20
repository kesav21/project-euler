#!/usr/bin/runghc

module MinMajority (hasMinMajority) where

import           Data.List (reverse, sort)


-- (thread 105) grimbal's method

hasMinMajority' :: [Int] -> Bool
hasMinMajority' l = maxs >= mins
    where len = (1 + length l) `div` 2 - 1
          maxs = sum . (take len) . reverse $ l
          mins = sum . (take (len + 1)) $ l

hasMinMajority :: [Int] -> Bool
hasMinMajority = hasMinMajority' . sort


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

    print . sort $ list
    print . hasMinMajority $ list

