data Shape = Circle Float| Rectangle Float Float

area:: Shape-> Float
area (Circle x) = x*x*pi
area (Rectangle a b) = a*b
-------------
data WeekDays = Segunda Int [String]|Terca Int [String]|
                Quarta Int [String] | Quinta Int [String]|
                Sexta Int [String]  | Sabado | Domingo


segunda:: WeekDays
segunda = Segunda 4 ["Projetao"]

terca:: WeekDays
terca = Terca 4 ["PLC","OUTRA COISA"]

sab:: WeekDays
sab = Sabado

isFDS::WeekDays -> Bool
isFDS Sabado = True
isFDS Domingo = True
isFDS _  = False

checkPlc::[String]-> Bool
checkPlc [] = False
checkPlc (x:xs) | x == "PLC" = True
                | otherwise = checkPlc xs


hasPLC::WeekDays-> Bool
hasPLC (Segunda a b) = (checkPlc b)
hasPLC (Terca a b) = (checkPlc b)
hasPLC (Quinta a b) = (checkPlc b) 
hasPLC (Quarta a b) = (checkPlc b)
hasPLC (Sexta a b) = (checkPlc b)
hasPLC _ =  False


-----------------
data Tree t = NilT | Node t (Tree t) (Tree t) deriving (Show, Eq)

tr:: Tree Int
tr = Node 4 (Node 3 (Node 2 NilT NilT) NilT) (Node 5 NilT NilT)

tl:: Tree Int
tl = Node 3 (Node 4 NilT NilT) (Node 6 NilT NilT)



----
data List t = Nil | Cons t (List t)
data Expr = Lit Int | Add Expr Expr | Sub Expr Expr

showExpr:: Expr->String
showExpr (Lit v) = show v
showExpr (Add a b) = showExpr a ++"+"++ showExpr b
showExpr (Sub a b) = showExpr a ++"-"++ showExpr b 

toList:: List t -> [t]
toList Nil = []
toList (Cons t k) = (t:toList(k))

fromList:: [t] -> List t
fromList [] = Nil
fromList (x:xs) = (Cons x (fromList xs))
-------------
depth:: Tree t -> Int
depth NilT = 0
depth (Node _ a b) = 1+(max (depth a)  (depth b))

collapse::Tree t-> [t]
collapse NilT = []
collapse (Node a l r) = [a] ++(collapse l)++ (collapse r)

bfs:: Tree t ->t-> Bool












