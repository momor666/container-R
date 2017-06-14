run_sum_R <- function(x, n) {

  sz <- length(x)
  
  ov <- vector(mode = "numeric", length = sz)
  
  # sum the values from the beginning of the vector to n
  ov[n] <- sum(x[1:n])
  
  # loop through the rest of the vector
  for(i in (n+1):sz) {
    ov[i] <- ov[i-1] + x[i] - x[i-n]
  }
  
  # pad the first n-1 values with NA
  ov[1:(n-1)] <- NA
  
  return(ov)
}

suppressMessages(library(TTR))
library(rbenchmark)

set.seed(123)
x <- rnorm(10000)
# benchmark run_sum_R for given values of x and n
benchmark( run_sum_R(x, 50), run_sum_R(x, 100),
          run_sum_R(x, 150), run_sum_R(x, 200),
          order = NULL)[,1:4]
