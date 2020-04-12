#!/usr/bin/env runghc
import Data.List.Split
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (\[n,p]->(read n,p)) . chunksOf 2
toString = id
answer (n,p) = fst $ foldr (f n d) ("",((0,0),(0,0))) $ p
  where d = head p
f n d p (cs,((e1,s1),(e2,s2)))
  |e1/=e2 || s1/=s2 = if d==e then g (if e1+1<n then e else s) else g (if s1+1<n then s else e)
  |otherwise = g (if p==e then s else e)
    where g c=(c:cs,(m c (e1,s1),m p (e2,s2)))
m p (e0,s0)=(e0 + if p==e then 1 else 0, s0 + if p/=e then 1 else 0)
e='E'
s='S'
