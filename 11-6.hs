module Main (main) where
import System.IO (stdout, hSetBuffering, BufferMode(NoBuffering))

--infoA :: Int a -> IO [IO String a, IO Double a, IO Double a, IO Double a]
infoA :: Int -> IO [(Int, Float, Float, Float)]
infoA num = 
    if num <= 0
        then return []
        else do putStr "Matricula: "
                mat <- readLn
                putStr "Nota 1: "
                n1 <- readLn
                putStr "Nota 2: "
                n2 <- readLn
                putStr "Nota 3: "
                n3 <- readLn
                xs <- infoA (num - 1)
                return ((mat, n1, n2, n3):xs)

imprimeA :: (Show a, Show b, Show c, Show d) => (Show e, Show f) => [(a, b, c, d)] -> [(e, f)]-> IO ()
imprimeA [] [] = return ()
imprimeA ((a, b, c, d): xs) ((e, f) : xss) = 
    do putStrLn ("Mat: " ++ show a ++ " -- Nota final : " ++ show e ++ " -- Situação: " ++ show f)
       imprimeA xs xss            

retNFinal :: IO [(Int, Float, Float, Float)] -> IO [(Float, String)]
retNFinal [] = return []
retNFinal ((_, n1, n2, n3): xs) =
    if media < 3 
        then do list <- ((media, "reprovado" :: String): xs)
                return ()
                
        else if media <= 7 
            then return ((media, "exame especial") : (retNFinal xs))
            else return ((media, "aprovado") : retNFinal xs)
    where media = (n1+n2+n3)/3

main :: IO ()
main =
    do hSetBuffering stdout NoBuffering
       putStr "Digite o numero de alunos da turma: "
       num <- readLn
       listaAl <- infoA num
       let l = listaAl
       listaResult <- retNFinal (l)
       imprimeA listaAl listaResult
       
       
