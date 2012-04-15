#!/usr/bin/env runghc
import Control.Monad
import Data.List

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u $ analyze cs
  where
    u (n:s:p:tx) = show $ nsn + min s sn
      where
        mns = (p-1)*3+1
        ms = if p<2 then p else (p-2)*3+2
        (nsg,sg) = partition (>=mns) tx
        nsn = length nsg
        sn = length $ filter (>=ms) sg
    analyze = map $ map read . words
