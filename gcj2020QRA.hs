#!/usr/bin/env runghc
import Data.List
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze [] = []
analyze (c:cs) = (n,map (map read . words) a): analyze b where
  n = read c
  (a,b) = splitAt n cs
toString = unwords.map show
answer (n,m) = [k,r,c] where
  k = sum$zipWith(\i a->a!!i)[0..]m
  r = f m
  c = f$transpose m
  f = length.filter(/=n).map(length.group.sort)
