module Geometry.Cuboid
( volume
, area
) where

volume :: Float -> Float -> Float -> Float
volume x y z = rectangleArea x y * z

area :: Float -> Float -> Float -> Float
area x y z = rectangleArea x y * 2 + rectangleArea y z * 2 + rectangleArea x z * 2

rectangleArea :: Float -> Float -> Float
rectangleArea x y = x * y