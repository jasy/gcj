#!/usr/bin/env runghc
import Control.Monad
import Maybe

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u $ analyze cs
  where
    u ([r,k,n]:[g]) = show $ f r 0 0 (cycle g) []
      where
        f 0 e _ _ _ = e
        f r e p g l =
          if isJust v
          then
            let [pr,pe] = fromJust v
                dr = pr-r
            in f (r`mod`dr) (e+(e-pe)*(r`div`dr)) p g []
          else f (r-1) (e+de) ((p+dp)`mod`n) (drop dp g) ((p,[r,e]):l)
          where
            v = lookup p l
            (de,dp) = (\s->(last s, length s)) $ takeWhile (<=k) . scanl1 (+) $ take n g
    analyze [] = []
    analyze xs = map (map read . words) (take 2 xs) : analyze (drop 2 xs)
