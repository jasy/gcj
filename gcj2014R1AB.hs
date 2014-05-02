#!/usr/bin/env runghc
import Data.List
import Data.Function
import Data.Array
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze (c:cs) = (n,map (map read . words) a) : analyze r where
  n = read c
  (a,r) = splitAt (n-1) cs
toString = show
answer (n,a) = minimum . map (fst . f 0) $ [1..n] where
  f p c
    | length t>=2 = (d+(sum.take 2.sort.map (uncurry (-))$t), d+1)
    | otherwise = (d, d+1)
    where
    t = map (f c) $ g!c \\ [p]
    d = sum . map snd $ t
  g = array (1,n) . map (\gr -> (fst.head$gr, map snd gr)) . groupBy ((==) `on` fst)
    . sort . concatMap (\[x,y] -> [(x,y),(y,x)]) $ a
