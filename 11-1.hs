module Main (main) where
import System.IO (stdout, hSetBuffering, BufferMode(NoBuffering))

somaNum :: Int -> IO Double
somaNum num
    | num <= 0 = return 0
    | num > 0 = do putStrLn "Digite um número: "
                   x <- readLn
                   sum <- somaNum (num - 1)
                   return (x+sum)

main :: IO ()
main =
    do hSetBuffering stdout NoBuffering
       putStr "Quantidade de números: "
       num <- readLn
       soma <- somaNum num
       putStrLn ("Soma dos números digitados: " ++ (show soma))