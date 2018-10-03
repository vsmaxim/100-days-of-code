module Geometry.Cube
( volume
, area
) where

import qualified Geometry.Cuboid as Cuboid

volume :: Float -> Float
volume x = Cuboid.volume x x x

area :: Float -> Float
area x = Cuboid.area x x x
