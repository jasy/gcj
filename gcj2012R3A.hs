#!/usr/bin/env runghc
import Data.List
import Data.List.Split
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (map (map read . words)) . chunksOf 3
toString = unwords . map show
answer [_,l,p] = map (negate . snd) . reverse . sort . zip (zipWith (/) p l) $ [0,-1..]
