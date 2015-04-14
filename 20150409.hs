import Data.Char

mapi :: (t -> u) -> [t] -> [u]
mapi f [] = []
mapi f (a:as) = f a : map f as

mapi2 :: (t -> u) -> [t] -> [u]
mapi2 f [] = []
mapi2 f l = [f k|k<-l]
 
alfa::Char->Int
alfa c | 'a'<=c && 'z'>=c  = ((ord c) - ba) + 1
       | 'A'<=c && 'Z'>=c  = ((ord c) - bA)+ 1
	   |otherwise = -1
		where ba = ord 'a' ; bA = ord 'A'
 
posicaoAlfabeto :: String->[Int]
posicaoAlfabeto s = mapi alfa s  


member::(Eq t)=>t->[t]->Bool
member v ls = foldr (func v) False ls

func::(Eq t)=>t->t->Bool->Bool
func a v b = v==a ||b

union::(Eq t)=>[t]->[t]->[t]
union [] l2 = l2
union (h1:t1) l2 = (foldr (func2) (h1:t1) l2)


func2::(Eq t)=>t->[t]->[t]
func2 v [] = v:[]
func2 v (h2:t2) | v == h2 = v:t2
			    | otherwise = h2:(func2 v t2)


somaElem::[String]->[Int]
somaElem [] = []
somaElem (h1:t1) = (foldr (+) 0(posicaoAlfabeto h1)): somaElem t1

data Tree t = Nil |Tree t (Tree t) (Tree t) deriving (Show, Ord, Eq)

insert::(Ord t) => t->Tree t->Tree t
insert  v Nil = Tree v Nil Nil
insert  v (Tree k a b)| k>v = (Tree k (insert v a) b)
                      | otherwise = (Tree k  a (insert v b))

criarArvore:: (Ord t)=>[t]->














