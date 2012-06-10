#!/usr/bin/env runghc
import Control.Monad
import Data.List

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r->"Case #"++show i++": "++r) [1..] $ solve c
  mapM_ putStrLn ss

solve (c:cs) = map u $ take (read c) $ analyze cs
  where
    u (_:l:p:[]) = foldr (\a b -> ' ' : show a ++ b) "" i
      where
        i = map ((n-) . snd) . reverse . sort . zip e . reverse $ take n [1..]
        n = length e
        e = (zipWith (/) p l)
    analyze xs = map (map read . words) (take 3 xs) : analyze (drop 3 xs)
