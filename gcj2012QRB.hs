#!/usr/bin/env runghc
import Control.Arrow
import Data.List
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map $ map read . words
toString = show
answer (n:s:p:ts) = count . assort $ ts where
  count = uncurry (+) . (length *** (min s . length))
  assort = partition (>=hi) . filter (>=lo) where
    lo = (max 0 (p-2))*2+p
    hi = (max 0 (p-1))*2+p
