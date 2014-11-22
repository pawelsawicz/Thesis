
module KieferWolfowitz where

--function created only for tests
testFunction :: Double -> Double
testFunction x = ((2 * sin x ^ 2 + cos x) / 2) + (x * 0.1)

getAnParameter :: Double -> Double
getAnParameter i = 1.0 / (i + 1.0)

getCnParameter :: Double -> Double
getCnParameter i = 2.0 /(i ** (1/6))

kieferWolfowitz :: [Double] -> Double -> (Double, Double)-> [Double] --change [Double] into [Int]
kieferWolfowitz [] _ (_,_)= []
kieferWolfowitz (x:xz) previousPoint (domain1, domain2) = calculatedPoint : kieferWolfowitz xz calculatedPoint (domain1, domain2)
	where calculatedPoint = calculatePoint x previousPoint (domain1, domain2)

calculatePoint :: Double -> Double -> (Double, Double)-> Double
calculatePoint i oldValue (domain1, domain2)
	| newPoint > domain1 = domain1
	| newPoint < domain2 = domain2
	| otherwise = newPoint
	where
		cn = getCnParameter i
		an = getAnParameter i
		newPoint = oldValue - an * ((testFunction(oldValue + cn)-testFunction(oldValue - cn))/cn)
