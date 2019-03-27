module Main (main) where
import System.IO (stdout, hSetBuffering, BufferMode(NoBuffering))

opcao1 :: Double -> Double
opcao1 sal =
    if sal < 500
        then sal*0.05
        else if sal <= 850
            then sal*0.1
            else sal*0.15

opcao2 :: Double -> Double
opcao2 sal =
    if sal < 450
        then sal+100
        else if sal < 750
            then sal+75
            else if sal <= 1500
                then sal + 50
                else sal + 25

opcao3 :: Double -> String
opcao3 sal =
    if sal <= 750
        then "mal remunerado"
        else "bem remunerado"


main :: IO ()
main =
    do hSetBuffering stdout NoBuffering
       putStrLn "---------------"
       putStrLn "Opções: "
       putStrLn "---------------"
       putStrLn "1. Imposto"
       putStrLn "2. Novo salário"
       putStrLn "3. Classificação"
       putStrLn "---------------"
       putStr "Digite a opcao desejada: "
       op1 <- getLine
       let op = read op1
       if op == 1
        then do putStrLn "Cálculo do imposto"
                putStr "Digite o salário: "
                sal1 <- getLine
                let imp = (opcao1 (read sal1))  :: Double
                putStrLn ("Imposto calculado: " ++ (show imp))
        else if op == 2
            then do  putStrLn "Cálculo do novo salário"
                     putStr "Digite o salário: "
                     sal2 <- getLine
                     let salf = (opcao2 (read sal2)) :: Double
                     putStrLn ("Novo salário: " ++ (show salf))
            else if op == 3
                then do putStrLn "Classificação do salário"
                        putStr "Digite o salário: "
                        sal3 <- getLine
                        let salf = show (opcao3 (read sal3))  ::String
                        putStrLn ("Classificação obtida: " ++  salf)
                else putStrLn "Opção inválida!"