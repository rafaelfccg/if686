compose::(Show t) => (t -> t) -> [(t -> t)] -> [t -> t]
compose f [] = []
compose f [g] = [f.g]
compose f (g:gs) = [f.g] ++ (compose f gs)
----
data Tree t = NilT | Node t (Tree t) (Tree t) deriving (Show, Eq)

tr:: Tree Int
tr = Node 4 (Node 3 (Node 2 NilT NilT) NilT) (Node 5 NilT NilT)

tl:: Tree Int
tl = Node 3 (Node 4 NilT NilT) (Node 6 NilT NilT)

tk:: Tree Int
tk =(Node 5 (Node 7 (Node 15 NilT (Node 6 NilT NilT)) (Node 2 NilT NilT)) (Node 10 NilT NilT))

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree f NilT =  NilT
mapTree f (Node t tl tr) = Node (f t) (mapTree f tl) (mapTree  f tr)


foldTree:: (t->u->u->u)-> u->Tree t -> u
foldTree _ s NilT = s
foldTree f s (Node a tr1 tr2) = f a (foldTree f s tr1) (foldTree f s tr2) 

sumi::Int->Int->Int->Int
sumi a b c= ((a+b)+c)
------------------------

data Edge = Edge Int Int deriving (Eq,Show,Ord) -- vai para / Custo
data Node t = Nodi Int t [(Edge)] deriving (Eq,Show,Ord)

mapGraph :: (t -> u) -> [Node t] -> [Node u]
mapGraph f [] =  []
mapGraph f ((Nodi i t le):xs) = (Nodi i (f t) le):(mapGraph f xs)

foldGraph:: (t->u->u)-> u->[Node t] -> u
foldGraph _ s [] = s
foldGraph f s ((Nodi i a le):xs) = f a (foldGraph f s xs)
----------
filterTree::(t->Bool)->Tree t->[Tree t]
filterTree _ NilT = []
filterTree  f (Node t tr tl) | not (f t ) = (filterTree f tr)++(filterTree f tl)
                             | otherwise  = (removeFtree f (Node t tr tl)):(filterTreeAux f (Node t tr tl))

filterTreeAux::(t->Bool)->Tree t->[Tree t]
filterTreeAux f NilT = []
filterTreeAux f (Node v tr tl) | (f v) = (filterTreeAux f tr)++(filterTreeAux f tl)
                               | otherwise = (filterTree f tr) ++ (filterTree f tl)

removeFtree:: (t->Bool)-> Tree t->Tree t
removeFtree f NilT = NilT
removeFtree f (Node v tr tl)| (f v) = (Node v (removeFtree f tr) (removeFtree f tl))
							| otherwise = NilT




--------------------------------------EXERCICIOS EM AULA-----------------------------------


filterLists:: [[Int]]->Int->[[Int]]
filterLists l v =  filter (\x->(foldr (+) 0 x)>= v) l

inter::(Eq t)=>[t]->[t]->[t]
inter [] _ = []
inter _ [] = []
inter (x:xs) ys= (filter (==x) ys) ++ (inter xs ys)

diff::(Eq t)=>[t]->[t]->[t]
diff [] y = y
diff x [] = x
diff x y  |  int == [] = x++y
		  |  otherwise = (diff (filter (/=(head int)) x) (filter (/=(head int)) y))
                  where int = (inter y x)


mapfilter::(t->Bool)->[[t]]->[[t]]
mapfilter f [] = []
mapfilter f (x:xs) = [a | a<-x, f a]:(mapfilter f xs )



















