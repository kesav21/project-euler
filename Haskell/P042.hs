#!/usr/bin/runghc


import           Data.Char (ord)


--
-- calculates the word value of a string
-- SKY = 55
--
wordValue :: String -> Int
wordValue = sum . (map ((+(-64)) . ord))

--
-- a list of the first triangle numbers
-- maximum word value is 192
--
triangles :: [Int]
triangles = map (\x -> (x * (x+1)) `div` 2) [1..20]

--
-- checks if a sum if a triangular sum
--
isTriWord :: Int -> Bool
isTriWord n = n `elem` triangles

--
-- returns the number of triangular words in a list
--
numTriWords :: [String] -> Int
numTriWords = length . (filter (isTriWord . wordValue))

--
-- handles parsing of file and result
--
wrapper :: String -> String
wrapper = show . numTriWords . (read::String->[String])


main :: IO ()
main = interact wrapper

