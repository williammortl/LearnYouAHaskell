module Main where

import Data.List
import System.IO

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
    putStrLn "Number to get factorial of: "
    input <- getLine
    let number = read input :: Int
    putStrLn ("Factorial of " ++ show number ++ " is: " ++ show (factorial number))