#!/usr/bin/env runghc
import Text.Printf
import Data.List
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze (c1:c2:cs) = (b,n,map read . words $ c2) : analyze cs
  where [b,n] = map read . words $ c1
toString = printf "%.6f" ::Double->String
answer (b,n,x) = maximum (0.0:p) where
  r = 37
  y = replicate (r-n) 0 ++ sort x ++ [maximum x+b+1]
  p = [cost(i,j,h)| i<-[1..r], j<-[i..r],
       h<-[min ((b-(j-i)+sum(take j y))`div`j) (y!!j-1)],
       h>0, h>=y!!(i-1), h+1>=y!!(j-1)]
  cost (i,j,h) = u*(fromIntegral r-1.0)/fromIntegral i-u-d where
    u = fromIntegral (h*i-sum(take i y))
    d = fromIntegral ((h+1)*(j-i)-sum(drop i . take j $ y))
