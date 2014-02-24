#!/usr/bin/env runghc
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (map read . words)
toString = show
answer [r,t] = f 0 (r+t+1) where
  f lo hi
    | lo+1>=hi = lo
    | 2*m*r+2*m*m-m>t = f lo m
    | otherwise = f m hi
    where m = (lo+hi)`div`2
