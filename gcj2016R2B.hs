#!/usr/bin/env runghc
import Control.Parallel.Strategies
import Data.Bits
import Data.List.Split
import Text.Printf
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (\[nk,ps]->(map read nk,map read ps)) . chunksOf 2 . map words
toString = printf "%.6f"::Double->String
answer ([n,k],ps) = maximum $ map f a where
  a = map (\x->map (testBit x) [0..n-1]) . filter ((==k).popCount) $ [0..(bit n-1::Int)]
  f = (!!(k`div`2)) . foldr g [1.0] . map fst . filter snd . zip ps
  g p qs = zipWith (+) (0.0:map (*p) qs) (map (*(1-p)) qs++[0.0])
