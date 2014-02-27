#!/usr/bin/env runghc
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map ((\[l,n]->(l,read n::Int)) . words)
toString = show
answer (l,n) = cnt (0,(-1,0)) . zip [0..] $ l where
  m = length l
  cnt (s,_) [] = s
  cnt (s,(b,cc)) ((i,c):xs)
    | c `elem` "aeiou" = cnt (s,(b,0)) xs
    | cc+1<n = cnt (s,(b,cc+1)) xs
    | otherwise = cnt (s+(i-n-b+1)*(m-i),(i-n+1,cc+1)) xs
