#!/usr/bin/env runghc
import Control.Parallel.Strategies
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = id
toString = id
answer::String->String
answer (s:ss) = lastword [s] ss
lastword as@(w:ws) (s:ss) = lastword ns ss
  where ns = if w>s then as++[s] else s:as
lastword ws [] = ws
