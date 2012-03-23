#!/usr/bin/env runghc
import Control.Monad
import Data.List

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u $ analyze cs
  where
    u a = show $ (g - x `mod` g) `mod` g
      where
        (x:xs) = sort $ nub a
        g = (foldl1 gcd . map (subtract x)) xs
    analyze = map (tail . map read . words)
