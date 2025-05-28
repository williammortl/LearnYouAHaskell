-- Optional: module declaration
module Main where

-- Imports must come before any code
import Data.List
import System.IO

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!" 

main :: IO ()
main = putStrLn ((lucky 7) ++ " | " ++ (lucky 777))