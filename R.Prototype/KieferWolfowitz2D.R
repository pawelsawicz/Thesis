KieferWolfowitz <- function(FUN, randomPointX, randomPointY, domainX1,domainX2,domainY1,domainY2)
{
  iterations <- 10;
  oldPointX <- randomPointX;
  oldPointY <- randomPointY;
  for(i in 1:iterations)
  {
    An <- (1 / (i + 1));
    Cn <- (2/(i^(1/6)));
    newPointX <- oldPointX - An * ((FUN(oldPointX + Cn,0) - FUN(oldPointX - Cn,0))/ Cn);
    newPointY <- oldPointY - An * ((FUN(0,oldPointY + Cn) - FUN(0,oldPointY - Cn))/ Cn);
    if(newPointX > domainX2){
      newPointX <- domainX2;
    }
    if(newPointX < domainX1){
      newPointX <- domainX1;
    }
    if(oldPointY > domainY2){
      newPointY <- domainY2;
    }
    if(oldPointY < domainY1){
      newPointY <- domainY1;
    }
    oldPointX <- newPointX;
    oldPointY <- newPointY;
    
    #print(oldPointX);
    #print(oldPointY);
  }
  bestPositions <- c(oldPointX, oldPointY);
  #bestPositions
}

KieferWolfowitz_Test_version <- function(FUN, randomPointX, randomPointY, domainX1,domainX2,domainY1,domainY2)
{
  x <- seq(domainX1, domainX2, 0.1);
  y <- seq(domainY1, domainY2, 0.1);
  z <- outer(x,y,functionToSolve);
  result <- KieferWolfowitz(FUN, randomPointX, randomPointY, domainX1, domainX2, domainY1, domainY2);
  par(bg = "white");
  persp(x, y, z, theta = 90, phi=30, expand = 0.3, col = "lightblue",
        ltheta = 120, shade = 0.75, ticktype = "detailed", border = NA, box = TRUE)
  result
}
functionToSolve <- function(x,y)
{
  z <- x^2 + y^2 - sin(x*y) + cos(3*y)
}