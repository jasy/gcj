#!/usr/bin/env runghc
import Control.Parallel.Strategies
import Text.Printf
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = repeat . const 0.0
toString = printf "%.6f" ::Double->String
answer = id
