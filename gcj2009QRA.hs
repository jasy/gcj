#!/usr/bin/env runghc
import Text.Regex
import Data.Maybe
import Control.Arrow
main = mapM_ putStrLn . zipWith caseno [1..] . solve . lines =<< getContents
caseno i r = "Case #"++show i++": "++r
toString = show
solve (x:xs) = map (toString . answer) ts where
  [l,d,n] = map read $ words x
  (ws,ts) = second (take n) $ splitAt d xs
  answer t = length . flip filter ws $ isJust . matchRegex (cnvRegex t)
cnvRegex = mkRegex . map cnvChar
cnvChar '(' = '['
cnvChar ')' = ']'
cnvChar x = x
