quadDouble :: Integer -> Integer
quadDouble x = (x*2)^2

doubleQuad :: Integer -> Integer
doubleQuad x = (x^2)*2

verifTri :: Integer -> Integer -> Integer -> Bool
verifTri a b c
    | a + b > c = True
    | a + c > b = True
    | b + c > a = True
    | otherwise = False

t310 :: Float -> Float -> Float
t310 sal luz = ((sal/5)*luz)*0.85

t52 :: [a] -> a
t52 (x:[]) = x
t52 (x:xs) = t52 xs

t53 :: [a] -> [a]
t53 [] = []
t53 (x:[]) = []
t53 (x:xs) = x : t53 xs

t54 :: [a] -> ([a], [a])
t54 lista = (take k lista, drop k lista)
    where
        k = div (length lista) 2