#!/usr/bin/runghc

import           P044 (isPentagonal)


hexagonals :: [Int] -> [Int]
hexagonals = map (\i -> i * (2 * i - 1))


main :: IO ()
main = do

    -- all hexagonal numbers are triangular
    print . head . (filter (isPentagonal)) . hexagonals $ [144..]

