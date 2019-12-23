#!/usr/bin/runghc

import           Data.Char (digitToInt)


productDigits :: [Int] -> Int
productDigits = product . (map (digitToInt . get . pred))
    where num = concat . (map (show)) $ [1..]
          get i = num !! i


main :: IO ()
main = do

    let indices =  [1, 10, 100, 1000, 10000, 100000, 1000000]

    print . productDigits $ indices

