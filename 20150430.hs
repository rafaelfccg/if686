data Failable t = Correct t | Error [Char] deriving Show


instance Monad Failable where
 (>>=) (Correct x) f = f x
 (>>=) (Error s) _ = (Error s)
 return x = Correct x



data Fila t  = CFila [t] Int deriving Show

criarFila:: Int->t->Failable(t,Fila t)
criarFila sz v | sz==0 = Error "Fila de tamanhao 0."
			   | otherwise = Correct(v, CFila [v] sz)

push:: t->(t,Fila t)->Failable(t, Fila t)
push v (g,(CFila l sz)) | sz == (length l) = Error "Fila esta cheia"
                        | otherwise = Correct(head$l,CFila (l++[v]) sz)

pop:: (t,Fila t) -> Failable(t, Fila t)
pop (g,(CFila [] sz)) = Error "Fila vazia"
pop (g,(CFila (x:xs) sz)) = Correct(x, (CFila xs sz))

peek:: (t,Fila t) -> Failable(t, Fila t)
peek (g,(CFila [] sz)) = Error "Fila vazia"
peek (g,(CFila (x:xs) sz)) = Correct(x, (CFila (x:xs) sz))


test::Failable(Int,Fila Int)
test = (criarFila 0 10)>>= \x->push 40 x >>= pop >>=pop >>=pop









