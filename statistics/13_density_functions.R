# PDF Probability Density Function

xs <- seq(0.005,0.01,by=0.00001)
xs.all <- seq(0,1,by=0.0001) 

trueValues <- 300
falseValues <- 40000 - trueValues

plot(
  xs, 
  dbeta(xs, trueValues, falseValues),
  type='l',
  lwd=3, 
  ylab="density", 
  xlab="probability of subscription", 
  main="PDF Beta(300,39700)",
)


# CDF Cumulative Density Function

plot(xs, pbeta(xs, trueValues, falseValues), type='l')
grid(30, 10, col = 'grey')

# Confidence interval

# Probability greater than 80%:
pbeta(1, trueValues, falseValues) - pbeta(0.008, trueValues, falseValues)


# Quantile (mirror the CDF, y -> x)

xs.cum <- seq(0.01,0.99,by=0.001)
plot(xs.cum, qbeta(xs.cum, trueValues, falseValues), type='l')
