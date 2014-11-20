--RandomSearch not-parallel
module RandomSearch where
import System.Random
import Control.Applicative
import KieferWolfowitz


--function created only for tests
functionToSolve :: Double -> Double
functionToSolve x = ((2*sin(x)^2 + cos(x)) / 2) + (x*0.1)

getRandomPoint :: (Double, Double) -> IO [Double]
getRandomPoint (x, y) = do
	g <- newStdGen
	return . take 20 $ (randomRs(x,y) g)

getFunctionMinimum :: Double -> Double
getFunctionMinimum randomValue = functionToSolve(funcMinimum)
	where
		domain1 = randomValue + 0.5
		domain2 = randomValue - 0.5
		funcMinimum =  last (kieferWolfowitz [1..10] randomValue (domain1, domain2))

--randomSearchMain :: Double -> (Double, Double) -> IO ()
--randomSearchMain i (x,y) = do
--	point <- getRandomPoint(x,y)
--	print point

-- random search
-- to check if it makes any sense (?) 
randomSearch :: [Double] -> Double
randomSearch (x:[]) = randomSubsetMinimum
	where
		randomSubsetMinimum = getFunctionMinimum(x)
randomSearch (x:zs)
	| randomSubsetMinimum < randomSearch(zs) = randomSubsetMinimum
	| otherwise = randomSearch(zs)
	where
		randomSubsetMinimum = getFunctionMinimum(x)
