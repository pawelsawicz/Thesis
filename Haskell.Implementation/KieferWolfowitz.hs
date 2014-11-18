
module KieferWolfowitz where

--function created only for tests
testFunction :: Double -> Double
testFunction value = value * value

getAnParameter :: Double -> Double
getAnParameter iteration = (1.0 / (iteration + 1.0))

getCnParameter :: Double -> Double
getCnParameter iteration = (2.0/(iteration**(1/6)))