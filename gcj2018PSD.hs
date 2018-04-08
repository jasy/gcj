#!/usr/bin/env runghc
import Data.List
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map ((\[a,b]->(a,b)) . map read . words)
toString = intercalate " " . map show
answer (n,k)
  |k==1 = [n`div`2,(n-1)`div`2]
  |odd(n) = answer (n`div`2,k`div`2)
  |odd(k) = answer (n`div`2-1,k`div`2)
  |otherwise = answer (n`div`2,k`div`2)
