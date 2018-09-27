doubleMe x = x + x
doubleUs x y = x * 2 + y * 2
doubleSmallNumber x = if x > 100 then x else x * 2
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1 -- yay, nice function name :3

-- DoubleNumber x = x * 2
addThreeLists x y z = x ++ y ++ z
addThreeLists' x y z = x:y:z:[] -- That also works

-- List things
testList = [1, 2, 3, 4, 5, 6]
sixthValue = testList !! 5
reversedList = reverse testList
headOfList = head testList
tailOfList = tail testList -- list without first Element
initOfList = init testList -- list without last element
firstThreeItems = take 3 testList
listWithoutFirstThree = drop 3 testList
listMultiplication = product testList
listSum = sum testList

evenNumbers = [2,4..1000]
evenChars = ['B', 'D'..'Z'] -- this is "BDFHJLNPRTVXZ" because "asd" is syntax-sugar for ["a", "s", "d"]
reverseNumbers = [20,10..1] -- can't do 20..1
firstMultiples = take 24 [13,26..] -- Yay, infinite list
laughXTimes x = take (x * 4) (cycle "LOL ")
arrayOfFives x = take x (repeat 5) -- same as replicate 5 x
arrayOfFives' x = replicate x 5

-- Comprehensions
listComprehension = [x | x <- [50..100], x `mod` 7 == 3]
fizzbuzzHmmm xs = [if (x `mod` 3) == 0 then "Fizz" else "Buzz" | x <- xs]
severalPredicates = [x | x <- [10..20], x /= 13, x/=15, x /= 19]
allMultiplications = [x * y | x <- [1, 2, 3], y <- [4, 5, 6]]

nouns = ["hobo", "frog", "pope"]
adj = ["lazy", "grounchy", "scheming"]
meaningfullCombinations = [x ++ " " ++ y | x <- adj, y <- nouns]
length' xs = sum [1 | _ <- xs] -- Hi, Andy
removeUppercase st = [c | c <- st, c `elem` ['a'..'z']] -- elem checks that element is in list

xxs = [[1,2,2,2,2,3,3,4,5,6], [1,2,3], [4, 5,6]]
evens = [[x | x <- xs, even x] | xs <- xxs] -- Nested list comprehension

stupidTuple = (1, 12)
zipValues x y = (x, y)
variousData = ("Hello", "World", 123)
enumerate x = zip [1..] x

-- Some serious shit
triangles = [(a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10]]
rightTriangles = [(a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10], a^2 + b^2 == c^2]
rightTriangles' = [(a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10], a^2 + b^2 == c^2, a + b + c == 24]
