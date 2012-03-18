#!/usr/bin/env runghc
import Control.Monad
import Data.List

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u cs
  where
    u x = show $ foldl (+) 0 $ zipWith f (reverse x) [0..]
      where
        uniq = nub x
        base = let n = length uniq in if n==1 then 2 else n
        vmap = zip uniq (1:0:[2..])
        f c d = cnv vmap * (base ^ d)
          where cnv ((k,v):ms) = if c==k then v else cnv ms
