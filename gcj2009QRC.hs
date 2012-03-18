#!/usr/bin/env runghc
import Control.Monad
import Text.Printf

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map f cs
  where
    t = "welcome to code jam"
    format = printf "%04d" ::Int->String
    f xs = format $ last $ g xs (1:replicate (length t) 0)
    g [] dp = dp
    g (x:xs) (dp:dps) = g xs $ dp : zipWith3 h (dp:dps) dps t
      where h p n s = if x/=s then n else mod (p+n) 10000
