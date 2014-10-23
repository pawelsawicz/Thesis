FuctionToSolve <- function(x)
{
  y <- ((x^2 + 0.1*x)*sin(x));
}

TestFunction <- function(x){
  y <- x^2
}

KieferWolfowitz <- function(FUN, randomPoint){
  x <- seq(3,6,0.1);
  y <- FUN(x);
  numberOfIterations <- 10;
  oldPoint <- randomPoint;
  allPoints <- c();
  for(n in 1:numberOfIterations){
    An <- (1 / (n + 1));
    Cn <- (2/(n^(1/6)));
    newPoint <- oldPoint - An * ((FUN(oldPoint + Cn)-FUN(oldPoint - Cn))/(Cn));
    allPoints<- c(allPoints, newPoint);
    oldPoint <- newPoint
  }
  plot(x,y, 'l')
  randomPoint
  allPoints  
}

StandardMin <- function(FUN){
  #x <- seq(4,6,0.1);
  x <- seq(-4,4,0.1);
  y <- FUN(x);
  plot(x,y, 'l')
  min(y) 
}

#KieferWolfowitz(FuctionToSolve, runif(1,3,6));

