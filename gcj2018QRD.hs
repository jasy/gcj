#!/usr/bin/env runghc
import Text.Printf
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map read::[String]->[Double]
toString = concatMap (("\n"++).unwords.map (printf "%.16f"))
answer a=map r [[0.5,0,0],[0,0.5,0],[0,0,0.5]]where
  r::[Double]->[Double]
  r[x,y,z]=[x2,y2,z2]where
    g x y c=(x*cos c-y*sin c,x*sin c+y*cos c)
    (x2,y1)=g x y b
    (y2,z2)=g y1 z c
  (b,c)
    |a<sqrt 2 =(bi (\x->cos x+sin x<a) (pi/4),0)
    |otherwise=(pi/4,bi (\x->sqrt 2*cos x+sin x<a) 0.615478)
bi f e=g 100 0 e where
  g n lo hi
    |n<=0=lo
    |f m      =g (n-1) m hi
    |otherwise=g (n-1) lo m
    where m=(lo+hi)/2
