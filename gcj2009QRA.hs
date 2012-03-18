#!/usr/bin/env runghc
import Control.Monad
import Text.Regex

main = do
  c <- liftM lines getContents
  let ss = zipWith (\i r-> "Case #"++show i++": "++show r) [1..] $ solve c
  mapM_ putStrLn ss

solve (x:xs) = map f rs
  where
    [l,d,n] = map read $ words x
    w = take d xs
    ts = take n $ drop d xs
    rs = map (mkRegex . (map cnvChar)) ts
    f r = length $ filter (isJust . (matchRegex r)) w

cnvChar '(' = '['
cnvChar ')' = ']'
cnvChar x = x

isJust (Just _) = True
isJust Nothing = False
