--RandomSearch not-parallel

module RandomSearch where

import KieferWolfowitz
import System.Random

functionToSolve :: Double -> Double
functionToSolve argument = argument * argument

getFunctionMinimum :: Double -> Double
getFunctionMinimum nth = nth 

-- generate n element array

getRandomPointsForFunction :: Int -> [Double]
getRandomPointsForFunction 0 = []
getRandomPointsForFunction numberOfPoints = [2.0] ++ (getRandomPointsForFunction (numberOfPoints - 1)) 

getRandomPoint :: Double
getRandomPoint = 5.0 -- random point generator within main domain

-- random search
-- to check if it makes any sense (?) 
randomSearch :: [Double] -> Double
randomSearch (x:[]) = getFunctionMinimum(x)
randomSearch (x:zs)
	| getFunctionMinimum(x) < randomSearch(zs) = getFunctionMinimum(x)
	| otherwise = randomSearch(zs)

randomSearchN :: Int -> Double
randomSearchN 0 = getFunctionMinimum(getRandomPoint)  
randomSearchN nTimes
	| getFunctionMinimum(kieferWolfowitz(getRandomPoint)) <  randomSearchN(nTimes-1) = getFunctionMinimum(kieferWolfowitz(getRandomPoint))
	| otherwise = randomSearchN(nTimes-1) 

-- 1. Generate N point - > return [Double]
-- 2. Run map k-w steps for each point
-- 3. Take result and check (?)
--if searchMin() < previouseMin()
--
--

