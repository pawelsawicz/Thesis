FuctionToSolve <- function(x)
{
  y <- ((2*sin(x)^2 + cos(x)) / 2) + (x *0.1);
}

FuncMin <- function(FUN, RandomPoint, R)
{
  domain1 <- RandomPoint - R;
  domain2 <- RandomPoint + R;
  x <- seq(domain1,domain2,0.1);
  y <- FUN(x);
  plot(x,y, type='l')
  min(y)
}

RandomSearch <- function(FUN, domain1, domain2)
{
  numberOfIterations <- 10;
  result <- c();
  x <- seq(domain1,domain2,0.1);
  y <- FUN(x);
  plot(x,y, type='l')
  for(i in 1:numberOfIterations)
  {
    result <- c(result,FuncMin(FUN, 5,0.5));
  }
  result
}

RandomSearch(FuctionToSolve, 0,15)

