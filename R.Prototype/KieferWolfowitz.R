KieferWolfowitz <- function(FUN, randomPoint, domain1, domain2){  
  numberOfIterations <- 30;
  oldPoint <- randomPoint;  
  for(n in 1:numberOfIterations){
    An <- (1 / (n + 1));
    Cn <- (2/(n^(1/6)));
    newPoint <- oldPoint - An * ((FUN(oldPoint + Cn)-FUN(oldPoint - Cn))/(Cn));
    if(newPoint < domain1){
      newPoint <- domain1
    }
    if(newPoint > domain2){
      newPoint <- domain2;
    }   
    oldPoint <- newPoint
  }  
  oldPoint
}


KieferWolfowitz_Test_Version <- function(FUN, randomPoint, domain1, domain2){
  x <- seq(domain1,domain2,0.1);
  y <- FUN(x);
  numberOfIterations <- 30;
  oldPoint <- randomPoint;
  allPoints <- c();
  plot(x,y, 'l')
  for(n in 1:numberOfIterations){
    An <- (1 / (n + 1));
    Cn <- (2/(n^(1/6)));
    newPoint <- oldPoint - An * ((FUN(oldPoint + Cn)-FUN(oldPoint - Cn))/(Cn));
    if(newPoint < domain1){
      newPoint <- domain1
    }
    if(newPoint > domain2){
      newPoint <- domain2;
    }
    allPoints<- c(allPoints, newPoint);
    oldPoint <- newPoint
    points(newPoint, FUN(newPoint));
  }  
  randomPoint
  allPoints  
  oldPoint
}