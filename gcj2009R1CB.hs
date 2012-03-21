#!/usr/bin/env runghc
import Control.Monad

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u $ analyze cs
  where
    u [x,y,z,vx,vy,vz] = show d++" "++show t
      where
        a = vx*vx+vy*vy+vz*vz
        b = 2*(x*vx+y*vy+z*vz)
        c = x*x+y*y+z*z
        b2_4ac = b*b-4*a*c
        s = sqrt b2_4ac
        t1 = ((-b)-s) / (2*a)
        t2 = ((-b)+s) / (2*a)
        t =
          if a==0
          then
            if b==0
            then 0
            else max 0 ((-c)/b)
          else
            if b2_4ac < 0
            then max 0 ((-b)/(2*a))
            else
              if t1>=0
              then t1
              else
                if t2>=0
                then t2
                else 0
        d = sqrt (a*t*t+b*t+c)
    analyze::[String]->[[Double]]
    analyze [] = []
    analyze (x:xs) = l : analyze (drop n xs)
      where
        n = read x ::Int
        l = cf 6 $ map (map read . words) $ take n xs
        cf 0 il = []
        cf i il = avg : cf (i-1) (map tail il)
          where avg = sum (map head il) / fromIntegral n
