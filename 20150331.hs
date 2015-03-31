import Data.Char

nextSt::Char->Int->[(Int,Int,Char)]->Int
nextSt x b [] = 0
nextSt x b ((f,t,c):xs) | (x==c && f == b) = t
					  | otherwise = (nextSt x b xs)

contain::[Int]-> Int-> Bool
contain [] b = False
contain (x:xs) b 	| x==b = True
					| otherwise = (contain xs b)

afd:: String->[Int]->[(Int,Int,Char)]->Int->[Int]->Bool
afd [] st tr b e = contain e b
afd (x:xs) st tr b e  	| ntst <0 =  False
						| otherwise =  (afd xs st tr ntst e)
					where ntst = nextSt x b tr


----- Q2

toHex::Int->String
toHex t | t<16  = [intToDigit t]
		| otherwise =  (toHex (div t 16))++[(intToDigit (mod t 16))]


toDec:: String->Int->Int
toDec [] sz =0
toDec (x:xs) sz = (pow 16 (sz-1))*(digitToInt x)+ (toDec xs (sz-1))
				
pow:: Int->Int->Int
pow a b | b ==0 = 1
		| otherwise = a*(pow a (b-1)) 

somatorioHexadecimalAux::[String]->Int
somatorioHexadecimalAux [] = 0
somatorioHexadecimalAux (x:xs) = (toDec x (length x))+ (somatorioHexadecimalAux xs)

somatorioHexadecimal::[String]->String
somatorioHexadecimal l = (toHex (somatorioHexadecimalAux l) )

-----Q3

revert::String->String
revert [] = []
revert (x:xs) = (revert xs)++[x]

isPalindrome:: String ->String
isPalindrome l 	| ((mod len 2 )==0 && (revert (take (div len 2) l))== (drop (div len 2) l) ) = "PALINDROME" 
				| ((mod len 2 )==1 && (revert (take (div len 2) l))== (drop (div (len+1) 2) l )) = "PALINDROME"
				| otherwise = "NAO PALINDROME"
				where len = length l

palindromoDecimal::String->String
palindromoDecimal  s = (show dec)++" - " ++ (isPalindrome (show dec))
					where dec = toDec s (length	s)








