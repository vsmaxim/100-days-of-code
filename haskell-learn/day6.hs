import Data.List
import qualified Geometry.Cube as Cube
import Shapes
import Vector

cubeVolume = Cube.volume 3


center = Shapes.Point 10 20
concentricCircles = map (Shapes.Circle center) [1..10]

-- Student is defined by first_name and last_name
data Student = Student [Char] [Char] deriving (Show)

fullName :: Student -> [Char]
fullName (Student firstName lastName) = firstName ++ " " ++ lastName

firstNames = ["Maxim", "Katherine", "Anonym"]
secondNames = ["Vasilev", "Frolova", "Mysterious"]

studentsPack = zipWith (\f l -> Student f l) firstNames secondNames
fullNamesPack = map fullName studentsPack

-- Records

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)


data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)
data Maybe' a = Nothing | Just a

firstVec = Vector.Vector 3 5 8
secondVec = Vector.Vector 4 2 1
sumVec = firstVec `Vector.vplus` secondVec
multVec = firstVec `Vector.vectMult` 4
scalarMultVec = firstVec `Vector.scalarMult` secondVec