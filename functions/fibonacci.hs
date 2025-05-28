module Main where

import Data.List
import System.IO
import System.Environment (getArgs)

fibonacci :: (Integral a) => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = (fibonacci (n - 2)) + (fibonacci (n - 1)) 

main :: IO ()
main = do
    args <- getArgs
    case args of
        [x] -> do
            let number = read x :: Int
            putStrLn ("Fibonacci of " ++ show number ++ " is: " ++ show (fibonacci number))
        _   -> putStrLn "\nUsage:\n\nThis program calculates the nth fibonacci number using recursion.\n\n\t./fibonacci {what number to calculate fibonacci number of}\n"    