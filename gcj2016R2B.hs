#!/usr/bin/env runghc
import Control.Parallel.Strategies
import Data.List
import Data.List.Split
import Text.Printf
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (\[nk,ps]->(map read nk,map read ps)) . chunksOf 2 . map words
toString = printf "%.6f"::Double->String
answer ([n,k],ps) = maximum $ map f a where
  a = let qs=sort ps in map (\i->take i qs++drop (n-k+i) qs) [0..k]
  f = (!!(k`div`2)) . foldr g [1.0]
  g p qs = zipWith (+) (0.0:map (*p) qs) (map (*(1-p)) qs++[0.0])
