functionToSolve <- function(x,y)
{
  z <- (x^2) + (y^2) - (sin(x*y)) + (cos(3*y));
}

LocalMinimum <- function(FUN, x, y, R)
{
  domainX1 <- x - R;
  domainX2 <- x + R;
  domainY1 <- y - R;
  domainY2 <- y + R;  
  result <- KieferWolfowitz_Test_version(FUN, x, y, domainX1, domainX2, domainY1, domainY2);
  FUN(result[1],result[2])
}

RandomSearch <- function(FUN, domainX1,domainX2,domainY1,domainY2,R)
{
  x <- seq(domainX1,domainX2,0.5);
  y <- seq(domainY1,domainY2,0.5);
  z <- outer(x,y,functionToSolve);
  
  iterations <- 40;
  RandomPoints <- matrix(0, iterations, 2);
  results <- NULL;
  bestPoint <- NULL;
  for(i in 1:iterations)
  {    
    randomX <- runif(1,domainX1, domainX2);
    randomY <- runif(1,domainY1, domainY2);
    RandomPoints[i,1] = randomX;
    RandomPoints[i,2] = randomY;
    result <- LocalMinimum(FUN, randomX, randomY, R);
    results <- c(results, result);
    if(i == 1)
    {
      bestPoint <- result;
    }
    if(result < bestPoint)
    {
       bestPoint <- result;
    }
  }
  #print(RandomPoints)
  #print(RandomPoints[,1])
  
  #results
  par(bg = "white");
  persp(x, y, z, theta = 90, phi=30, expand = 0.3, col = "lightblue",
        ltheta = 120, shade = 0.75, ticktype = "detailed", border = NA, box = FALSE)
  #min(z)
  #RandomPoints
  bestPoint
}