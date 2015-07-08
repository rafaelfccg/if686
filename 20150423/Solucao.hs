

qsortSum :: [Int] -> [Int]
qsortSum [] = []
qsortSum (a:as) = qsortSum [x | x <- as, somaDigitos (toDigits x) <= somaDigitos (toDigits a)] ++ [a]
			   ++ qsortSum [y | y <- as, somaDigitos (toDigits y) > somaDigitos (toDigits a)]

somaDigitos :: [Int] -> Int
somaDigitos [] = 0
somaDigitos (x:xs) = x + (somaDigitos xs)

toDigits :: Int -> [Int]
toDigits = map digitToInt . show
		  
--------
etWord :: String -> String
getWord [] = []
getWord (x:xs) | x==' ' =[]
               | otherwise = x:(getWord xs)

dropWord :: String -> String
dropWord [] = []
dropWord (x:xs) | x/=' ' = dropWord xs
                | otherwise = x:xs

dropSpace :: String -> String
dropSpace [] = []
dropSpace  (x:xs) | x==' ' = dropSpace xs
                  | otherwise = x:xs


type Word = String

splitWords :: String -> [Word]
splitWords [] = []
splitWords x | word /= ""  = (getWord x):(splitWords $ dropSpace $ dropWord $ x)
			 | otherwise = (splitWords $ dropSpace $ dropWord $ x)
	          where word = getWord x
	          