type Graph = [(Int,[Int])]

bfs::Graph->Int->Int->[Int]
bfs g s e | s ==e = [s]
		  | res ==[] = []
          | otherwise = (s:res)
               where res = (doBfs g e (snd (findNode g s)) [s])

doBfs::Graph->Int->[Int]->[Int]->[Int]
doBfs [] _ _ _  = []
doBfs g _ [] _  = []
doBfs g e (a:adj) mark  | elem e (a:adj) = [e]
                        | (isPart a ls adj g) = a:ls
                        | otherwise =  ls
                            where ls = doBfs g e (remove (adj ++ (snd (findNode g a)))  (a:mark)) (a:mark) 

remove:: (Eq t)=>[t]->[t]->[t]
remove [] mark = []
remove adj [] = adj
remove adj mark = [a | a<- adj , not (a `elem` mark) ]

isPart:: Int->[Int]->[Int]->Graph->Bool
isPart a [] adj g = False
isPart a [x] _ _ = True
isPart a ls [] g = True
isPart a ls adj g = (head ls) `elem`(snd (findNode g a)) && (not ((head ls) `elem` adj ))



findNode::Eq t=>[(t,[t])] ->t->(t,[t])
findNode [] n = (n,[])
findNode (x:xs) id | (fst x) == id = x
                   | otherwise = (findNode xs id)


grafoo::[(Int,[Int])]
grafoo = [(1,[2,3,4]),(2,[1,3]),(3,[4,5]),(4,[1,5,2]),(5,[2]),(6,[1])]


getLine
getChar
putStrLn
putStr
