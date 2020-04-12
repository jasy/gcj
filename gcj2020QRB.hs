#!/usr/bin/env runghc
import Data.Char
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = id
toString = id
answer = f 0
f n [] = replicate n ')'
f n (c:cs) = p++c:f k cs where
  k = digitToInt c
  p = if n<k then replicate(k-n)'(' else replicate(n-k)')'
