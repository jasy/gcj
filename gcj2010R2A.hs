#!/usr/bin/env runghc
import Control.Parallel.Strategies
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze (c:cs) = (k,n,x): analyze xs where
  k = read c
  n = k*2-1
  (x,xs) = splitAt n cs
toString = show
answer (k,n,x) = minimum [cost(i,j)|i<-[0..n-1],j<-[0..n-1],elegant(i,j)] where
  cost (i,j) = (k+d i+d j)^2-k^2 where d = abs . subtract (k-1)
  elegant (i,j) = r && c where
    r = all (f comp . splitAt i) x
    c = f (all comp . uncurry zip) . splitAt j $ x
    f fc (xs,y:ys) = all fc . zip ys $ reverse xs
    f _ _ = True
comp (x,y) = x==y || x==' ' || y==' '
