#!/usr/bin/env runghc
import Control.Monad

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u $ analyze cs
  where
    u [[d,i,m,n],a] = show $ f a (repeat 0)
      where
        f [] dp = minimum dp
        f (a:as) dp = f as dpn
          where
            dpn = ins [min (del x) (mdf x)|x<-[0..255]]
            ins dp = if m==0 then dp else [minimum (zipWith (\v c->c+((abs (x-v))+m-1)`div`m*i) [0..255] dp)|x<-[0..255]]
            del x = dp!!x+d
            mdf x = minimum $ map (+d) $ take (e-s+1) $ drop s dp 
              where
                d = abs (a-x)
                s = max 0 (x-m)
                e = min (x+m) 255
    analyze [] = []
    analyze xs = map (map read . words) (take 2 xs) : analyze (drop 2 xs)
