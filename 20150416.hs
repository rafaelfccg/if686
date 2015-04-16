--TRABALHO
import Data.List (sort)
import Data.List

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
----------Exercicios-


k::(t -> u->v) -> (u->t->v)
k f = \b a-> f a b

fpairlist::([(t,t)]->[t])
fpairlist = \l->[f |(f,s)<-l] 

filterlist::([[t]]->Int->[[t]])
filterlist = \ls v ->[m |m<-ls , (length ls )>v ]

fuzelists::(Eq t)=>[[t]]->[t]
fuzelists = \ls -> nub (foldr unioni [] ls)

unioni::(Eq t)=>[t]->[t]->[t]
unioni [] k = k
unioni k [] = k
unioni k (l1:l) | (l1 `elem` k) = (unioni k l)
				| otherwise = (unioni k l)++[l1]
-------

mapfoldr:: (t->u->u)->[u]->[[t]->u]
mapfoldr f [] = []
mapfoldr f (x:xs) = (\l -> (foldr f x l) ):(mapfoldr f xs)

---------------
sumL :: Int -> ([Int]->[Int])
sumL val = map (+val) 

maxL :: ([Int]->Int)
maxL =  \x -> foldr (max)  (minimum x) x