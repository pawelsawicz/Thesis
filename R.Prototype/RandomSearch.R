FuctionToSolve <- function(x)
{
  y <- ((2*sin(x)^2 + cos(x)) / 2) + (x *0.1);
}

FuncMin <- function(FUN, RandomPoint, R)
{
  domain1 <- RandomPoint - R;
  domain2 <- RandomPoint + R;  
  KieferWolfowitz(FUN, RandomPoint, domain1, domain2)  
}

RandomSearch <- function(FUN, domain1, domain2)
{
  numberOfIterations <- 40;
  result <- c();
  bestResult <- 0;
  x <- seq(domain1,domain2,0.1);
  y <- FUN(x);  
  for(i in 1:numberOfIterations)
  {
    randomPoint <- runif(1,domain1,domain2);
    result <- FuncMin(FUN, randomPoint,0.5);
    if(result <= bestResult){
      bestResult <- result
    }
  }
  plot(x,y, type='l')
  bestResult
}

RandomSearch(FuctionToSolve, 0,15)

