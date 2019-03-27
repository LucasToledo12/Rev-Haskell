module Main (main) where
    -- import System.IO (stdout, hFlush)
    import System.IO (stdout, hSetBuffering, BufferMode(NoBuffering))
    main :: IO ()
    main = 
        do hSetBuffering stdout NoBuffering
           putStr "Digite um número: "
           n1 <- getLine
           putStr "Digite outro número: "
           n2 <- getLine
           putStr "Digite outro número: "
           n3 <- getLine
           putStr "O produto entre os números é: "
           let s1 = read n1 :: Float
               s2 = read n2 :: Float
               s3 = read n3 :: Float
               prod = s1*s2*s3
           putStrLn (show prod)