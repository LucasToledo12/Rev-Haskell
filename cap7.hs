areaCirculo :: Floating a => a -> a
areaCirculo r = pi * r^2

degraus :: (Integral a, RealFrac b) => b -> b -> a
degraus q w = ceiling (w / q)