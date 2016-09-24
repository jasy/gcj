#!/usr/bin/env runghc
import Control.Parallel.Strategies
import Data.Bits
import Data.List
import Data.List.Split
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = parMap rpar (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (\[nk,ps]->(map read nk,map read ps)) . chunksOf 2 . map words
toString (g:gs) = intercalate "\n" $ "":g
toString _ = "\nIMPOSSIBLE"
answer ([r,c],ps) = map h . filter f $ [0..(bit (r*c)-1::Int)] where
  pps = map (\[a,b]->(a,b)) . chunksOf 2 . map (subtract 1) $ ps
  f b = all (\(i,j)->g i==j) pps where
    g i
      |i<c       = dfs (i,0) (0,1)
      |i<c+r     = dfs (c-1,i-c) (-1,0)
      |i<c+r+c   = dfs (c-(i-(c+r))-1,r-1) (0,-1)
      |i<c+r+c+r = dfs (0,r-(i-(c+r+c))-1) (1,0)
    dfs (x,y) (dx,dy) 
      |x<0 = (r-y-1)+c+r+c
      |c<=x = y+c
      |y<0 = x
      |r<=y = (c-x-1)+c+r
      |otherwise = dfs (x+dx',y+dy') (dx',dy')
      where (dx',dy') = if testBit b (y*c+x) then (-dy,-dx) else (dy,dx)
  h b = chunksOf c $ map (\i->if testBit b i then '/' else '\\') [0..(r*c)-1]
