
import Data.Char

doubleL :: [Int] -> [Int]
doubleL ls | ls == [] = []
		  | otherwise = (2 * (head ls)): doubleL (tail ls)

member :: [Int] -> Int -> Bool
member ls v | ls == [] = False
		     | (head ls) ==v = True
		     | otherwise = member (tail ls) v


digits :: String -> String
digits s | s == [] = []
		 | (head s)>='0' && (head s)<='9' = (head s):digits (tail s)
	 	 | otherwise = digits (tail s) 

sumPair :: [Int] -> [Int]->[Int]
sumPair l1 l2 | l1 == [] = []
		 	 | l2 == [] = []
		 	 | otherwise = ((head l1) + (head l2)):(sumPair (tail l1) (tail l2) )


--- QUCK SORT
lesser :: [Int]->Int->[Int]
lesser l1 p | l1==[] = []
			| (head l1) < p = (head l1):(lesser (tail l1) p)
			| otherwise = (lesser (tail l1) p)

greater :: [Int]->Int->[Int]
greater l1 p | l1==[] = []
			| (head l1) >= p = (head l1):(greater (tail l1) p)
			| otherwise = (greater (tail l1) p)

sort :: [Int] -> [Int]
sort l1 | l1==[] = []
		| otherwise = (sort (lesser (tail l1) (head l1))) ++ [(head l1)] ++ (sort (greater (tail l1) (head l1)))
--qsort1:: [Int] ->[Int]
--qsort1 []     = []
--qsort1 (p:xs) = qsort1 lesser ++ [p] ++ qsort1 greater
 ---   where
   --     lesser  = [ y | y <- xs, y < p ]
    --    greater = [ y | y <- xs, y >= p ]

-- FIBONACCI
pfib :: Int-> Int
pfib n		| n == 0 = [0]
	  		| n == 1 = [1]
	  		|  otherwise = pfib(n-1)+pfib(n-2)

auxFib :: Int->Int->[Int]
auxFib n k	| n==0 =[]
			| (((pfib k) mod 2) ==0 && (n==1)) = [pfib k]
			| (((pfib k) mod 2) ==0) = (pfib k): (auxFib (n-1) (k+1))
			| otherwise = (auxFib n (k+1))
fibpares:: Int->[Int]
fibpares n = (auxFib n 0)