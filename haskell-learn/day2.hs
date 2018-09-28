-- Type and typeclasses

removeNonUppercase :: [Char] -> [Char] -- Type declaration
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

multipleThree :: Int -> Int -> Int -> Int -- Here is how multiple types and return declarated
multipleThree x y z = x * y * z


testRead = read "4" :: Int -- read "4" couldn't work, because ghc can't infer type.
testRead' = read "4" :: Float

intBound = (minBound :: Int, maxBound :: Int)
charBound = (minBound :: Char, maxBound :: Char)
tupleBound = (minBound :: (Bool, Int, Char), maxBound :: (Bool, Int, Char))

testList = [1, 2, 3, 4, 5]
lengthPlusFloat = fromIntegral (length testList) + 3.2 -- length testList + 3.2 won't work, for some reason

-- Pattern Matching

lucky :: (Integral a) => a -> String -- Integral here to work with Int and Integer
lucky 7 = "Lucky number! You've got something!"
lucky x = "Yay, you're looser!"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe 6 = "Six!"
sayMe x = "Not between one and six :("

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = factorial (n - 1) * n

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors x y = (fst x + fst y, snd x + snd y)

addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (x1, x2) (y1, y2) = (x1 + y1, x2 + y2) -- Yay, that looks nice