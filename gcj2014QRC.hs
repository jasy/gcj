#!/usr/bin/env runghc
import Data.List
main = getContents >>= mapM_ putStr . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (map (read::String->Int) . words)
toString = unlines . ("":)
answer [r,c,m]
 | r==1 = [cc (c-m) c]
 | c==1 =  cc 1 1:replicate (r-m-1) (cd 1 1) ++ replicate m (cd 0 1)
 | n==1 = ('c':replicate (c-1) '*'):replicate (r-1) (replicate c '*')
 | n==2 || n==3 || n==5 || n==7 = im
 | n`mod`2==0 && n<=2*c = cc n2 c:cd n2 c:replicate (r-2) (cd 0 c)
 | n`mod`2/=0 && (r<3 || c<3) = im
 | n`mod`2/=0 && n<=2*c+1 = let n3=(n-3)`div`2 in cc n3 c:cd n3 c:cd 3 c: replicate (r-3) (cd 0 c)
 | b==0 = cc c c: (replicate (a-1) (cd c c) ++ replicate (r-a) (cd 0 c))
 | b/=1 = cc c c: (replicate (a-1) (cd c c) ++ (cd b c:replicate (r-a-1) (cd 0 c)))
 | otherwise = cc c c: (replicate (a-2) (cd c c) ++ (cd (c-1) c:cd 2 c:replicate (r-a-1) (cd 0 c)))
 where
   n = r*c-m
   n2 = n`div`2
   (a,b) = n`divMod`c
im = ["Impossible"]
cc a b = 'c':cd (a-1) (b-1)
cd a b = replicate a '.'++replicate (b-a) '*'
