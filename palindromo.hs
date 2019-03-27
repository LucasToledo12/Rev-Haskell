module Main (main) where
import System.IO (stdout, hSetBuffering, BufferMode(NoBuffering))
main :: IO ()
main =
    do putStrLn "Digite uma frase: "
       frase <- getLine
       let fraseRev = reverse frase
       if frase == fraseRev
         then putStrLn "É uma palíndrome!"
         else putStrLn "Não é uma palíndrome!"