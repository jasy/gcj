#!/usr/bin/env runghc
import Control.Monad
import Text.Regex

main = do
  [l,d,n] <- getLine >>= return . map read . words
  w <- replicateM d getLine
  forM_ [1..n] $ \i -> do
    l <- getLine
    let r = mkRegex $ map cnvChar l
    let m = length $ filter (isJust . (matchRegex r)) w
    putStrLn $ "Case #"++show i++": "++show m

cnvChar '(' = '['
cnvChar ')' = ']'
cnvChar x = x

isJust (Just _) = True
isJust Nothing = False
