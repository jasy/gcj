#!/usr/bin/env runghc
import Control.Parallel.Strategies
import Data.List
import Control.Arrow
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (map read . words)
toString ([n]:cs) = intercalate "\n" $ show n:map (intercalate " " . map show) cs
answer::[Int]->[[Int]]
answer [j,p,s,k]
  |s<k = answer [j,p,s,s]
  |otherwise  = [j*p*k]:zipWith3 (\a b c->[a,b,c]) jl pl sl where
  jl = concatMap (replicate (p*k)) [1..j]
  pl = cycle $ concatMap (replicate k) [1..p]
  sl = concat $ zipWith (\i b->take (p*k) $ drop i b) [0..] $ replicate j $ cycle [1..s]
