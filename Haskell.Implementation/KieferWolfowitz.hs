
module KieferWolfowitz where

--function created only for tests
testFunction :: Double -> Double
testFunction value = value * value

getAnParameter :: Double -> Double
getAnParameter iteration = (1.0 / (iteration + 1.0))

getCnParameter :: Double -> Double
getCnParameter iteration = (2.0/(iteration**(1/6)))

kieferWolfowitz :: [Double] -> Double -> [Double] --change [Double] into [Int]
kieferWolfowitz [] _ = []
kieferWolfowitz (x:xz) previousPoint = [calculatedPoint] ++ kieferWolfowitz xz calculatedPoint
	where calculatedPoint = calculatePoint x previousPoint

calculatePoint :: Double -> Double -> Double
calculatePoint i oldValue
	| newPoint > 5.0 = 5.0
	| newPoint < (-5.0) = -5.0
	| otherwise = newPoint
	where
		cn = getCnParameter(i)
		an = getAnParameter(i)
		newPoint = oldValue - an * ((testFunction(oldValue + cn)-testFunction(oldValue - cn))/cn)
