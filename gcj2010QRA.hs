#!/usr/bin/env runghc
import Control.Monad
import Data.Bits

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u $ analyze cs
  where
    u [n,k] = if (k .&. g) == g then "ON" else "OFF"
      where g = (shift 1 n)-1
    analyze = map (map read . words) ::[String]->[[Int]]
