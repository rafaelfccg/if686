vendas :: Int->Int
vendas x = 1 

funcs :: Int -> Int -> Int

funcs s n | n == 0 && s == vendas 0 = 1
		  | n == 0  = 0
		  | s == vendas n = (+) (funcs  s (n - 1)) 1
		  | otherwise = (funcs  s (n - 1))

