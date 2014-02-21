#!/usr/bin/env runghc
import Data.List
import Data.List.Split
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map answer . take (read c) . analyze $ cs ::[String]
analyze = map (take 4) . chunksOf 5
answer xs
  | won 'X' xs = "X won"
  | won 'O' xs = "O won"
  | any ('.' `elem`) xs = "Game has not completed"
  | otherwise = "Draw"
won c xs = any (all (`elem` [c,'T'])) $ concatMap ($xs) [id,transpose,cross]
cross xs = map (zipWith (!!) xs) [[0..],[3,2..]]
