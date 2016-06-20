#!/usr/bin/env runghc
import Control.Parallel.Strategies
import Data.List
import Control.Arrow
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze (c:cs) = map (map read . words) a: analyze b
  where (a,b) = splitAt ((read c)*2-1) cs
toString = intercalate " " . map show
answer::[[Int]]->[Int]
answer = map fst . filter (\x->snd x`mod`2/=0) . map (head &&& length) . group . sort . concat
