module Main (main) where
import System.IO (stdout, hSetBuffering, BufferMode(NoBuffering))

celsius :: Double -> Double
celsius f = (5*(f-32))/9


main :: IO ()
main =
    do hSetBuffering stdout NoBuffering
       putStr "Temperatura em Fahrenheit: "
       f1 <- getLine
       let f = read f1
           c1 = celsius f 
           temp = show c1
       putStr ("Temperatura em Celsius: " ++ temp)