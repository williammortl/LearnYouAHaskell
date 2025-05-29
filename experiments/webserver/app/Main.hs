{-# LANGUAGE OverloadedStrings #-}

import Network.Wai
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200, status404)
import qualified Data.ByteString.Lazy as BL  -- for file contents
import qualified Data.ByteString.Char8 as BS -- for HTTP headers
import System.Directory (doesFileExist)
import System.Environment (getArgs)
import System.FilePath ((</>), takeExtension)
import Data.Text (unpack)

main :: IO ()
main = do
    args <- getArgs
    case args of
      [rootDir] -> do
          putStrLn $ "Serving files from " ++ rootDir ++ " on http://localhost:8081"
          run 8081 (app rootDir)
      _ -> putStrLn "Usage: ./webserver <root-directory>"

app :: FilePath -> Application
app rootDir req respond = do
    let pathPieces = pathInfo req
        requestedFile = if null pathPieces
                          then "index.html"
                          else foldr1 (</>) $ map unpack pathPieces
        fullPath = rootDir </> requestedFile
    fileExists <- doesFileExist fullPath
    if fileExists
      then do
        contents <- BL.readFile fullPath
        respond $ responseLBS
          status200
          [("Content-Type", contentType fullPath)]
          contents
      else respond $ responseLBS
          status404
          [("Content-Type", "text/plain")]
          "404 - File not found"

-- crude MIME type detection based on file extension
contentType :: FilePath -> BS.ByteString
contentType path =
  case takeExtension path of
    ".html" -> "text/html"
    ".css"  -> "text/css"
    ".js"   -> "application/javascript"
    ".json" -> "application/json"
    ".png"  -> "image/png"
    ".jpg"  -> "image/jpeg"
    ".gif"  -> "image/gif"
    _       -> "text/plain"

