#!/usr/bin/env runghc
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map ((\[l,n]->(l,read n::Int)) . words)
toString = show
answer (l,n) = fst . foldr cnt (0,(m,0)) . zip [0..] $ l where
  m = length l
  cnt (i,c) (s,(b,cc))
    | c `elem` "aeiou" = (s,(b,0))
    | cc+1<n = (s,(b,cc+1))
    | otherwise = (s+(i+1)*(b-i-n+1),(i+n-1,cc+1))
