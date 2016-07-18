#!/usr/bin/env runghc
import Control.Parallel.Strategies
import Data.List
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (map read . words)
toString = id
answer (n:rps) = case filter ((rps==).fst) $ zip (ls!!n) (ss!!n) of
  [(_,s)] -> s
  [] -> "IMPOSSIBLE"
ts = [0]:map (\n->concatMap (\v->[v,(v+2)`mod`3]) (ts!!(n-1))) [1..]
ls = map (take 3 . map (take 3) . tails . cycle . cnt) ts where
  cnt = map (\v->length v-1) . group . sort . ([0..2]++)
ss = zipWith (\n t->map (srt (2^n) . cnv t) [0..2]) [0..] ts where
  cnv t i = map (\v->"RPS"!!((v+3-i)`mod`3)) t
  srt n xs = if n<2 then xs else concat $ sort ys where
    m = n`div`2
    ys = map (srt m) . (\(a,b)->[a,b]) . splitAt m $ xs
