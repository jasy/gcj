#!/usr/bin/env runghc
import Data.List
import Data.List.Split
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = chunksOf 2 . map (map read . words)
toString = show
answer [[a,n],m] = f a n . sort $ m
f _ n [] = n
f a n (m:ms)
  | a>m = f (a+m) (n-1) ms
  | a<=1 = n
  | otherwise = min n (f (a+a-1) (n+1) (m:ms))
