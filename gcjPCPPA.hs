#!/usr/bin/env runghc
import Data.List
import Data.Maybe
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map words
toString = id
answer [a,s,t] = reverse $ f $ foldl (\b c->b*n+fromJust(c`elemIndex`s)) 0 a
  where
    [n,m] = map length [s,t]
    f b = if b==0 then "" else t!!r:f d where (d,r) = b`divMod` m
