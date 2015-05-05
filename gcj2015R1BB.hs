#!/usr/bin/env runghc
import Control.Parallel.Strategies
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (map read . words)
toString = show
answer [r,c,n]
  | n<=(r*c+1)`div`2 = 0
  | min r c < 2 = a-m*2
  | any even [r,c] = f e2 e3 e4
  | otherwise = min (f c2 ((c3-o3)`div`2) e4) (f 0 ((c3+o3)`div`2) (e4-1))
  where
    f n2 n3 n4 = a - min n4 m * 4 - min n3 (max 0 (m-n4)) * 3 - min n2 (max 0 (m-n4-n3)) * 2
    a = r*(c-1)+(r-1)*c
    m = r*c-n
    c2 = min 2 r * min 2 c
    c3 = max 0 (r-2) * min 2 c + min 2 r * max 0 (c-2)
    c4 = max 0 (r-2) * max 0 (c-2)
    [e2,e3,e4] = map (\x->(x+1)`div`2) [c2,c3,c4]
    o3 = min 1 (r-1) * min 2 c + min 2 r * min 1 (c-1)
