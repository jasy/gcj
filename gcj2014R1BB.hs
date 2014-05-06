#!/usr/bin/env runghc
import Data.Bits
import Control.Applicative
import Control.Monad.State
import qualified Data.Map as M
main = getContents >>= mapM_ putStrLn . zipWith caseno [1..] . solve . lines
caseno i r = "Case #"++show i++": "++r
solve (c:cs) = map (toString . answer) . take (read c) . analyze $ cs ::[String]
analyze = map (map (read::String->Int) . words)
toString = show
answer abk = evalState (digit (29,False,False,False)) M.empty where
  [a,b,k] = map (subtract 1) abk
  digit :: (Int,Bool,Bool,Bool)->State (M.Map (Int,Bool,Bool,Bool) Int) Int
  digit (-1,_,_,_) = return 1
  digit key@(d,fa,fb,fk) = do
    memo <- get
    if M.member key memo
      then return $ memo M.! key
      else do
        let [ba,bb,bk] = map (flip testBit d) [a,b,k]
        s <- sum <$> sequence
                [digit (d-1,fa||ta<ba,fb||tb<bb,fk||tk<bk) |
                    ta<-[False,True], fa||ta<=ba,
                    tb<-[False,True], fb||tb<=bb,
                    let tk=ta&&tb,    fk||tk<=bk]
        get >>= put . M.insert key s
        return s
