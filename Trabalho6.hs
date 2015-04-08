data Edge t = Edge Int Int deriving (Eq,Show,Ord) -- vai para / Custo
data Node t = Nil |Node Int t [(Edge t)]  deriving (Eq,Show,Ord)
---Q1-------------

gtest:: [Node Int]
gtest = [Node 0 10 [(Edge 2 1),(Edge 3 1)] ,
         Node 1  123 [(Edge 0 2)] ,
         Node 2  14 [(Edge 3 2),(Edge 0 2)] ,
         Node 3  43 [] ]

gtest1:: [Node Int]
gtest1 = [Node 0 10 [(Edge 2 1),(Edge 3 1)] ,
         Node 3  43 [],
         Node 1  123 [(Edge 0 2)] ,
         Node 2  14 [(Edge 3 2),(Edge 0 2)] ]


preOrder:: [Node t]->[Node t]
preOrder [] = []
preOrder ((Node i v ls):xs) = (Node i v (qs ls)):(preOrder xs)

divide:: (Ord t)=>[t]->t->([t],[t])->([t],[t])
divide [] n p= p
divide (x:xs) n (me, ma)	|  x>n = (divide xs n (me,x:ma))
					 		| otherwise = divide xs n ((x:me),ma)
 
qs :: (Ord t)=>[t]->[t]
qs [] = []
qs p = (qs me )++ (head p):(qs ma)
		where (me,ma) = (divide (tail p) (head p) ([],[]))

equal::(Ord t) => [Node t]->[Node t]-> Bool
equal a b = (qs$preOrder$ a) == (qs$preOrder$ b)

----------------------------


--dfs::(Eq t,Ord t,Show t)=>[Node t]->t->Bool
--dfs g k = (dfsi (qs g) k [0] [])

dfsi::[Node t]-> t->[Int]->[Int]->Bool
dfsi [] k _ _ = False
dfsi g k [] _ = False
dfsi g k (x:xs) mark | val$n ==k = True
                     | otherwise = (dfsi g k ((getNeigh n)++xs ) x:mark )
                      where n = (g!!x)

val::Node t-> t
val (Node i v ls) = v

getNeigh::Node t->[Edge]
getNeigh (Node i v ls) = ls

elimina::[Int]->[Int]->[Int]
elimina [] _ = []
elimina [x] [] = [x]
elimina [x] (y:ys) | x==y = []
				   | otherwise = elimina [x] ys
elimina (x:xs) []  = x:xs
elimina (x:xs) (y:ys) | x==y = (elimina xs (y:ys))
                      | otherwise = (elimina [x] ys)++(elimina xs (y:ys))
























