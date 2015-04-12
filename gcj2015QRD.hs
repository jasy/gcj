#!/usr/bin/env runghc
import Control.Parallel.Strategies
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map $ map read . words
toString g = if g then "GABRIEL" else "RICHARD"
answer [x,r,c]
  | x >= 7 = False
  | r*c`mod`x /= 0 = False
  | x > max r c = False
  | (x+1)`div`2 > min r c = False
  | x<=3 = True
  | (x+1)`div`2 == min r c && r*c`div`x<=2 = False
  | otherwise = True
