
module KieferWolfowitz where

--function created only for tests
testFunction :: Double -> Double
testFunction x = ((2 * sin x ^ 2 + cos x) / 2) + (x * 0.1)

getAnParameter :: Double -> Double
getAnParameter i = 1.0 / (i + 1.0)

getCnParameter :: Double -> Double
getCnParameter i = 2.0 /(i ** (1/6))

calculatePoint :: Double -> Double -> (Double, Double)-> Double
calculatePoint i oldValue (d1, d2)
	| newPoint < d1 = d1
	| newPoint > d2 = d2
	| otherwise = newPoint
	where
		cn = getCnParameter i
		an = getAnParameter i
		newPoint = oldValue - an * ((testFunction(oldValue + cn)-testFunction(oldValue - cn))/cn)

kieferWolfowitz :: [Double] -> Double -> (Double, Double) -> Double
kieferWolfowitz xs startPoint (d1, d2) = foldl (\acc x -> calculatePoint x acc (d1,d2)) startPoint xs