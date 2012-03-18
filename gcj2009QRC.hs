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
    format::Int->String
    format = printf "%04d"
    f xs = format $ last $ g xs (1:replicate (length t) 0)
    g [] dp = dp
    g (x:xs) (dp:dps) = g xs $ dp : h dp dps t
      where
        h p [] [] = []
        h p (dp:dps) (s:ss) = n : h dp dps ss
          where
            n = if x==s then mod (p+dp) 10000 else dp
