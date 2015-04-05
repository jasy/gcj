#!/usr/bin/env runghc
import Data.List
import Data.List.Split
import qualified Data.Vector.Unboxed as V
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = chunksOf 2 . map (map read . words)
toString = show
answer [[d,i,m,n],a] = V.minimum $ foldl' f (V.replicate 256 0) a where
  f dp a = ins $ V.generate 256 (\x->min (del x) (mdf x)) where
    ins dp = if m==0 then dp else V.generate 256 (\x->V.minimum (V.zipWith (\v c->c+((abs (x-v))+m-1)`div`m*i) (V.enumFromN 0 256) dp))
    del x = dp V.! x + d
    mdf x = (+d) $ V.minimum $ V.slice s (e-s+1) dp where
      d = abs (a-x)
      s = max 0 (x-m)
      e = min (x+m) 255
