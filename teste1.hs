toDigits :: Integer -> [Integer] 
toDigits number
    | number <= 0 = []
    | number > 0 = toDigits (number `div` 10) ++ [number `mod` 10]

toDigitsRev :: Integer -> [Integer] 
toDigitsRev number
    | number <= 0 = []
    | number > 0 = number `mod` 10 : toDigitsRev (number `div` 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther (x:[]) = [x]
doubleEveryOther (x:y:zs)
    | (length (x:y:zs)) `mod` 2 /= 0 = x : y*2 : doubleEveryOther zs
    | otherwise = x*2 : y : doubleEveryOther zs

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs)
    | x > 10 = (x `div` 10) + (x `mod` 10 ) + sumDigits xs
    | x == 10 = 1 + sumDigits xs
    | otherwise = x + sumDigits xs

validate :: Integer -> Bool
validate number
    | sumDigits (doubleEveryOther(toDigits number)) == 0 = False
    | sumDigits (doubleEveryOther(toDigits number)) `mod` 10 == 0 = True
    | otherwise = False

type Peg = String 
type Move = (Peg, Peg) 
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _          = []
hanoi 1 start end _    = [(start, end)]
hanoi n start end temp =
    let nMinusOne = subtract 1 n
    in hanoi nMinusOne start temp end ++
       hanoi 1 start end temp ++
       hanoi nMinusOne temp end start