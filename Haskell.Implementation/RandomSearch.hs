--RandomSearch not-parallel

module Main where
import System.Random
import KieferWolfowitz

--global variables--
randomPoints :: Int
randomPoints = 30

subsetWidth :: Double
subsetWidth = 0.5

lGlobalDomain :: Double
lGlobalDomain = -20

rGlobalDomain :: Double
rGlobalDomain = 20
--end global variables
--function created only for tests
functionToSolve :: Double -> Double
functionToSolve x = ((2 * sin x ^ 2 + cos x) / 2) + (x * 0.1)

getRandomPoint :: (Double, Double) -> IO [Double]
getRandomPoint (x, y) = do
	g <- newStdGen
	return . take randomPoints $ randomRs(x,y) g

getKWValue :: Double -> Double
getKWValue x = kwResult
	where
		candidateD1 = x - subsetWidth
		candidateD2 = x + subsetWidth
		d1 = if candidateD1 < lGlobalDomain then lGlobalDomain else candidateD1
		d2 = if candidateD2 > rGlobalDomain then rGlobalDomain else candidateD2
		kwResult =  last (kieferWolfowitz [1..10] x (d1, d2)) 

randomSearch :: [Double] -> Double
randomSearch xs = minimum (map (functionToSolve) (map (getKWValue) xs))

main :: IO()
main = do
	print "Random Search with Kiefer - Wolfowitz SO"	
	randoms <- getRandomPoint(lGlobalDomain, rGlobalDomain)
	print (randomSearch randoms)
	inpStr <- getLine
	print "End"