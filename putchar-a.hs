module Main (main) where
    main :: IO ()
    main =
        do putStrLn "Digite um número"
           s1 <- getLine
           putStrLn "Digite outro número"
           s2 <- getLine
           putStr "Soma dos dois números digitados: "
           let n1 = read s1 :: Double
               n2 = read s2 :: Double
               soma = n1 + n2
           putStrLn(show soma)    
