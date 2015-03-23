

add:: Int->[Int]->[Int]
add n hp| hp==[] = [n]
		| otherwise = (bubbleUp (hp++[n]) ((length hp)) 0)


bubbleUp :: [Int]->Int->Int->[Int]
bubbleUp [] l p  = []
bubbleUp (x:xs) l p | xs==[] || ((l-p)-1) >= (length  xs)= (x:xs) 
					|((2*p)+1) == (l) && (x < (xs!!((l-p)-1))) = ([(xs!!((l-p)-1))]++(take (l-p-1) xs))++[x]++(drop (l-p) xs)
		 		 	|((2*p)+2) == (l) && x < (xs!!((l-p)-1)) = ([xs!!((l-p)-1)]++(take (l-p-1) xs))++[x]++(drop (l-p) xs)
		 		 	|((2*p)+1) == (l) || ((2*p)+2) == (l) = x:xs
		 		 	| (l)>((2*p)+2) = (bubbleUp (bubbleUp (x:(bubbleUp xs l (p+1))) ((2*p)+1) p) ((2*p)+2) p)
		 		 	| (l)>((2*p)+1) = (bubbleUp (x:(bubbleUp xs l (p+1))) ((2*p)+1) p)
		 		  	| otherwise =  x:(bubbleUp xs l (p+1)) 
		 		  	

remove::[Int]-> [Int]
remove [] = []
remove [x] = []
remove (x:y:z:xs) | z>y = (add y (z:xs))
			 	  | otherwise = (add z (y:xs))
remove [x,y] = [y]


sort ::[Int]->[Int]
sort hp | hp == [] = []
		| otherwise = (sort (remove hp))++[(head hp)]
		

makeheap:: [Int]->[Int]->[Int]
makeheap [] hp  = hp
makeheap (x:xs) hp = makeheap xs (add x hp)

heapsort:: [Int]->[Int]
heapsort l1 = sort (makeheap l1 [])
		 		  	
		 		  
		 	
crash  = (add 10 [9, 8, 7, 5, 4, 3, 2]);
main = print crash






 
