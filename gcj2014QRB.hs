#!/usr/bin/env runghc
import Text.Printf
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (map (read::String->Double) . words)
toString = printf "%.7f"
answer [c,f,x] = g 2 0 where
  g n t = if xt<=xt2 then xt+t else g (n+f) (t+ct) where
    ct = c/n
    xt = x/n
    xt2 = ct+x/(n+f)
