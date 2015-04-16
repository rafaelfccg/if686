--TRABALHO
import Data.List (sort)

listPartitioner:: (Num a, Ord a)=>[a]->([a]->[[a]])
listPartitioner l = partAux (sort l) 

partAux::(Num a,Ord a) => [a]->[a]->[[a]]
partAux _ [] = []
partAux [] k = [tail k]
partAux (f:fs) k | s<=f = (s:(partAux2 ss f)):(partAux fs (cut ss f)) 
					  | otherwise =  (partAux fs (s:ss))
						where s:ss = (sort k)

partAux2::(Num a,Ord a) => [a]->a->[a]
partAux2 [] _ = []
partAux2 (f:fs) v  | f<=v = f:(partAux2 fs v)
					    | otherwise =  []

cut:: (Num a, Ord a)=> [a]->a->[a]
cut [] _ = []
cut (x:xs) v | x>=v = x:(cut xs v)
             | otherwise =(cut xs v)
-----



