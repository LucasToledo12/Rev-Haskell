module Main (main) where
import System.IO (stdout, hSetBuffering, BufferMode(NoBuffering))


toDigits :: Integer -> [Integer]
toDigits x = reverse (toDigitsRev x)

toDigitsRev :: Integer -> [Integer]
toDigitsRev x | x < 0 = []
              | x < 10 = [x]
              | otherwise = (x `mod` 10 : toDigitsRev (x `div` 10))


doubleEveryOtherAux :: [Integer] -> [Integer]
doubleEveryOtherAux [] = []
doubleEveryOtherAux (x:y:xs) = (x:2*y: doubleEveryOtherAux xs)


doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther lista = doubleEveryOtherAux (reverse lista)

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs) | x >= 10 = (x `div` 10) + (x `mod` 10) + sumDigits xs
                 | otherwise = x + (sumDigits xs) 

validate :: Integer -> Bool
validate num | ((sumDigits (doubleEveryOther (toDigits num))) `mod` 10) == 0 = True
             | otherwise = False

main :: IO ()
main =
    do hSetBuffering stdout NoBuffering
       putStr "Digite o número do cartão de crédito: "
       num <- readLn
       let isVal = validate num
       if isVal
        then do putStrLn "O número do cartão de crédito é válido"
        else do putStrLn "O número do cartão de crédito não é válido"