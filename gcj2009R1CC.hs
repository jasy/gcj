#!/usr/bin/env runghc
import Control.Monad

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u $ analyze cs
  where
    u ([p,q]:[xs])= show $ f 2 dpi
      where
        dpi = replicate n $ replicate n 0
        n = q+2
        ns = 0:xs++[p+1]
        f i dp = if i==n then dp!!0!!(n-1) else f (i+1) dpn
          where
            dpn = upd dp $ zipWith g [0..(n-1-i)] [i..(n-1)]
            g s e = (s,e,v)
              where
                v = ((ns!!e)-(ns!!s)-2) + (minimum $ map h [(s+1)..(e-1)])
                h c = (dp!!s!!c) + (dp!!c!!e)
            upd dp [] = dp
            upd (dp:dps) ((s,e,v):xs) = dpu : upd dps xs
              where dpu = (take e dp)++[v]++(drop (e+1) dp)
    analyze::[String]->[[[Int]]]
    analyze [] = []
    analyze xs = x : analyze (drop 2 xs)
      where x = map (map read . words) $ take 2 xs
