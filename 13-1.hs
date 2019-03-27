prefixo :: Int -> [a] -> [a]
prefixo n lista =
    case (n, lista) of
        (0,_)       -> []
        (_, [])     -> []
        (n, (x:xs)) -> (x : prefixo (n-1) xs)