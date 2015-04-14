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