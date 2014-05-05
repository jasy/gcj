#!/usr/bin/env runghc
import Data.List
import Data.Function
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze (c:cs) = ss:analyze r
  where (ss,r) = splitAt (read c) cs
toString = id
answer ss = if c then "Fegla Won" else show $ sum' (map f wss) where
  wss = transpose . map (map (\w->(head w,length w)).group) $ ss
  c = c1 || c2 where
    c1 = ((/=) `on` length) (head wss) (last wss)
    c2 = any (\ws->any (((/=) `on` fst) $ head ws) ws) wss
f ws = sum' $ map (abs . subtract b) ns where
  ns = sort $ map snd ws
  b = ns!!(length ns`div`2)
sum' = foldl' (+) 0
