#!/usr/bin/env runghc
import Data.List.Split
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (\[c,_,p]->(read c, map read . words $ p)) . chunksOf 3
toString = unwords . map show . snd
answer (c,p) = maximum [(v,[i,j])| (i,a)<-ip, (j,b)<-ip, i<j, let v=a+b, v<=c]
  where ip = zip [1..] p
