split :: [Int]->([Int],[Int])
split [] =([],[])
split [x]=([x],[])
split (x:y:xs) =(x:fst (split xs),y: snd (split xs))

merge :: [Int]->[Int]->[Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
	 | x<y = [x]++(merge xs ([y]++ys))
     | otherwise = [y]++(merge ([x]++xs) ys)
				
mergesort:: [Int]-> [Int]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = merge (mergesort (fst (split xs))) (mergesort (snd (split xs)))


heapify:: [Int]->Int->[Int]

siftDown:: [Int]

 
