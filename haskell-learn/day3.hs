first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

xs = [(1, 2), (3, 4), (5, 6), (7, 8), (9, 10)]

newList = [a + b | (a, b) <- xs]

head' :: [a] -> a -- Yay, implementation of my own head function
head' [] = error "Empty list can't have head"
head' (x:_) = x

tail' :: [a] -> [a]
tail' [] = error "Empty list can't have tail"
tail' (_:x) = x

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x] -- A pattern to keep the full data reference, not only parts

ageCheck :: (Integral a) => a -> String
ageCheck age
    | age < 18  = "You're a child"
    | age < 30  = "You're a big child"
    | age < 50  = "You're a serious dude"
    | age < 80  = "Probably you already died!"
    | age < 120 = "You're walking dead!!!"
    | otherwise = "Hmmm, who minds."

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise                   = "You're a whale, congratulations!"

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b


hasSolutions :: (Ord t, Num t) =>  t -> t -> t -> Bool
hasSolutions a b c
    | discriminant < 0 = False
    | otherwise = True
    where discriminant = b ^ 2 - 4 * a * c

bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
    | bmi <= skinny = "Skinny"
    | bmi <= normal = "Normal"
    | bmi <= fat    = "FAT"
    | otherwise     = "FATASS"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

initials :: String -> String -> String
initials firstName secondName = [f] ++ ". " ++ [l] ++ "." -- better to (f:_) (s:_)
    where (f:_) = firstName
          (l:_) = secondName

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
-- calcBmis xs = [bmi w h | (w, h) <- xs]
--     where bmi weight height = weight / height ^ 2
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0] -- same as function defined above

 -- let binding
localFunctionTest = [let square x = x * x in (square 5, square 3, square 2)] -- [(25, 9, 4)]
test2 = (let (a, b, c) = (1, 2, 3) in a + b + c) * 100 -- 600


-- Recursion
minimum' :: (Ord a) => [a] -> a
minimum' [] = error "Empty list"
minimum' [x] = x
minimum' (x: xs)
    | x < minTail = x
    | otherwise = minTail
    where minTail = minimum' xs

replicate' :: (Num a, Ord a) => a -> b -> [b]
replicate' n x
    | n <= 0 = []
    | otherwise = x:replicate' (n - 1) x

take' :: (Num a, Ord a) => a -> [b] -> [b]
take' n _
    | n <= 0 = []
take' _ []   = []
take' n (x:xs) = x:take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

zip' :: [a] -> [a] -> [(a, a)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' a (x: xs)
    | a == x = True
    | otherwise = elem' a xs


quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x: xs) =
    let smaller = quicksort [y | y <- xs, y < x]
        bigger = quicksort [y | y <- xs, y >= x]
    in smaller ++ [x] ++ bigger