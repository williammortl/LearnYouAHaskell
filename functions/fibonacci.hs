module Main where

import Data.List
import System.IO
import System.Environment (getArgs)
import Text.Read (readMaybe)

fibonacci :: (Integral a) => a -> a
fibonacci n
    | n == 0    = 0
    | n == 1    = 1
    | otherwise = (fibonacci (n - 2)) + (fibonacci (n - 1)) 

usage = "\nUsage:\n\nThis program calculates the nth fibonacci number using recursion.\n\n\t./fibonacci {what number to calculate fibonacci number of}\n"

main :: IO ()
main = do
    args <- getArgs
    case args of
        [x] -> case readMaybe x :: Maybe Int of
            Just number -> putStrLn ("Fibonacci of " ++ show number ++ " is: " ++ show (fibonacci number))
            Nothing     -> putStrLn usage
        _   -> putStrLn usage