#!/usr/bin/env runghc
import Data.List
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze (c:cs) = map (map (read::String->Int) . words) a: analyze r
  where (a,r) = splitAt (read . head . words $ c) cs
toString a = if a then "YES" else "NO"
answer a = and . zipWith f c $ a where
  f x = and . zipWith (\y->(>= min x y)) r
  c = map maximum a
  r = map maximum . transpose $ a
