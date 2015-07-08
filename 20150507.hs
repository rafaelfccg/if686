------------------MAIS MONADS---------------------

type Stack = [Int]
type Fila = [Int]

newtype State a = State { runState :: Stack ->Fila-> (a,Stack,Fila) } 

instance Monad State where
 return x = State $ \st fl -> (x,st,fl)
 (State rS) >>= f = State $ (\st fl -> (let (x, newStack, newFila) = rS st fl
                                            (State newRS) = f x
                                        in (newRS newStack newFila)))


pop :: State Int
pop = State (\(a:as) x -> (a, as,x))

push :: Int -> State ()
push v = State (\s x -> ((), v:s,x))

insert :: Int -> State ()
insert v = State (\s x -> ((), s, (x++[v])))

remove :: State Int
remove = State (\s (x:xs) -> (x, s, xs))

initialStack :: Stack
initialStack = [45,5,6,66,4,3,2,7,8,83,439,4]

testStack :: State ()
testStack = do {
			 push 10;
			 push 7;
			 v4 <- pop;
			 v5 <- pop;
			 push v4;
			 push v5;
			 insert 10;
			 v6<-remove;
			 insert 20;
           }

main = putStr $ show (let
					x =(runState testStack initialStack [20, 30, 40, 55])
					

data Temperatura = Kelvin Float | Fahrenheit Float | Celsius Float


instance Eq Temperatura where
 (==) (Kelvin a) (Kelvin b) = a==b
 (==) (Celsius a) (Celsius b) = a==b
 (==) (Fahrenheit a) (Fahrenheit b) = a==b
 (==) (Kelvin a) (Celsius b) = (a-273)/5 == (b/5)
 (==) (Fahrenheit a) (Celsius b) = (a-32)/9 == (b/5)
 (==) (Kelvin a) (Fahrenheit b) = (a-273)/5==(b-32)/9
 
gggg::a->String->String
gggg s v = s++

instance Ord Temperatura where
 (<) (Kelvin a) (Kelvin b) = a<b
 (<) (Celsius a) (Celsius b) = a<b
 (<) (Fahrenheit a) (Fahrenheit b) = a<b
 (<) (Kelvin a) (Celsius b) = (a-273)/5 < (b/5)
 (<) (Fahrenheit a) (Celsius b) = (a-32)/9 < (b/5)
 (<) (Kelvin a) (Fahrenheit b) = (a-273)/5 <(b-32)/9
 (>) (Kelvin a) (Kelvin b) = a>b
 (>) (Celsius a) (Celsius b) = a>b
 (>) (Fahrenheit a) (Fahrenheit b) = a>b
 (>) (Kelvin a) (Celsius b) = (a-273)/5 > (b/5)
 (>) (Fahrenheit a) (Celsius b) = (a-32)/9 > (b/5)
 (>) (Kelvin a) (Fahrenheit b) = (a-273)/5 >(b-32)/9