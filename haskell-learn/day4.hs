-- curried functions
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z
multTwoWithNine = multThree 9 -- Curried function, that will take two parameters
multWithEighteen = multTwoWithNine 2 -- Curried function, with one parameter

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100 -- Same as compareWithHundred x = compare 100 x, but Curried

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z']) -- Curried infix function, yay

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

sumTwo :: (Num a) => a -> a -> a
sumTwo x y = x + y

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let less = quicksort (filter (<=x) xs)
        more = quicksort (filter (>x) xs)
    in less ++ [x] ++ more

findRoots :: (Floating a, Ord a) => a -> a -> a -> (a, a)
findRoots a b c = if (d < 0) then error "No real roots" else (x1, x2)
    where
        d = b^2 - 4 * a * c
        x1 = (-b + sqrt d) / (2 * a)
        x2 = (-b - sqrt d) / (2 * a)

gcd' :: (Integral a, Ord a) => a -> a -> a
gcd' x y
    | y == 0    = abs x
    | otherwise = gcd' y (mod x y)

eratosphen :: Int -> [Int]
eratosphen x
    | x <= 1 = []
    | otherwise = simplify [2..x]

simplify :: [Int] -> [Int]
simplify [x] = [x]
simplify (x:xs)
    | (fst <= floor (sqrt $ fromIntegral lst)) = fst:(simplify (filter (f) xs))
    | otherwise = fst:xs
    where fst = x
          lst = last xs
          f it = it `mod` x /= 0
