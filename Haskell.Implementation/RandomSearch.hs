--RandomSearch not-parallel

module Main where
import System.Random
import KieferWolfowitz


--function created only for tests
functionToSolve :: Double -> Double
functionToSolve x = ((2 * sin x ^ 2 + cos x) / 2) + (x * 0.1)

getRandomPoint :: (Double, Double) -> IO [Double]
getRandomPoint (x, y) = do
	g <- newStdGen
	return . take 20 $ randomRs(x,y) g

getFunMin :: (Double -> Double) -> Double -> Double
getFunMin f x = f funMin
	where
		domain1 = x + 0.5
		domain2 = x - 0.5
		funMin =  last (kieferWolfowitz [1..10] x (domain1, domain2))

-- random search
-- to check if it makes any sense (?) 
randomSearch :: [Double] -> Double
randomSearch (x:[]) = subsetMin
	where
		subsetMin = getFunMin (functionToSolve) x 
randomSearch (x:zs)
	| subsetMin < randomSearch zs = subsetMin
	| otherwise = randomSearch zs
	where
		subsetMin = getFunMin (functionToSolve) x

main :: IO()
main = do
	print "Random Search with Kiefer - Wolfowitz SO"
	print  (randomSearch [0.5,1..10])
	inpStr <- getLine
	print "End"