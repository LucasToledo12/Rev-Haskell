module Main (main) where
import System.IO (stdout, hSetBuffering, BufferMode(NoBuffering))

credito :: Double -> Double -> Bool
credito sal emp =
    if (sal*0.3) <= emp
      then True
      else False

main :: IO ()
main =
    do hSetBuffering stdout NoBuffering
       putStrLn "Análise de crédito"
       putStrLn "-------------------------------------------"
       putStr "Salário bruto: "
       sal <- getLine
       putStr "Valor da prestação: "
       prest <- getLine
       let s = read sal
           p = read prest
       if (credito s p) == False
         then putStrLn "O empréstimo pode ser concedido"
         else putStrLn "O empréstimo não pode ser concedido"