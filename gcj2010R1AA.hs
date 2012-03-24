#!/usr/bin/env runghc
import Control.Monad

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u $ analyze cs
  where
    u (n,k,t) = s (j 'R') (j 'B') 
      where
        r = map (take n . (++repeat '.') . reverse . filter (/='.')) t
        j c = or [and [f (x+dx*d) (y+dy*d)|d<-[0..(k-1)]]
                  |x<-[0..n],y<-[0..n],(dx,dy)<-[(1,0),(1,1),(0,1),(-1,1)]]
          where f x y =
                  if 0<=x && x<n && 0<=y && y<n
                  then c == (r!!x!!y)
                  else False
        s True True = "Both"
        s True False = "Red"
        s False True = "Blue"
        s False False = "Neither"
    analyze [] = []
    analyze (x:xs) = (n,k,take n xs) : analyze (drop n xs)
      where [n,k] = map read . words $ x
