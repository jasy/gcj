#!/usr/bin/env runghc
import Data.List
import Data.List.Split
import Data.Bits
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (map (map s2b . words) . tail) . chunksOf 3 :: [String]->[[[Integer]]]
  where s2b = foldl' (\b c-> shiftL b 1 + if c=='0' then 0 else 1) 0
toString a = if a/=inf then show a else "NOT POSSIBLE"
answer [os,ds] = minimum . map f $ os where
  ds' = sort ds
  f o = if ds' == (sort . map (xor b) $ os) then count b else inf
    where b = o `xor` head ds'
count 0 = 0
count b = 1 + count (b .&. (b-1))
inf = maxBound::Int
