#!/usr/bin/env runghc
import Data.Char
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = id
toString = unwords.map show
answer n = if all (/='4') (show na++show nb) then [na,nb] else f n where
  ni = read n
  na = ni `div` 2
  nb = ni - na
f=(\(a,b)->[a,b]).foldl (\v c->g v (digitToInt c)) (0,0)
g (a1,b1) i= (a1*10+a2,b1*10+b2) where
  (a2,b2)=if i==0 then (0,toInteger i) else if i/=5 then (1,toInteger i-1) else (2,3)
