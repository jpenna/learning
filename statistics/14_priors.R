xs <- seq(0, 1, by=0.001)
xs.cum <- seq(0.01, 0.99, by=0.001)
xs.less <- seq(0, 0.2, by=0.001)

trueValues = 2
falseValues = 5 - trueValues

plot(xs, dbeta(xs, trueValues, falseValues), type='l')


plot(xs, pbeta(xs, trueValues, falseValues), type='l')
abline(h=0.9, col='green')
abline(h=0.1, col='green')

plot(xs.cum, qbeta(xs.cum, trueValues, falseValues), type='l')
abline(h=0.8)

# Likelihood: the observed data
# Prior probability: extenal context information

# Mean conversion rate: 2.4% (a / a + b)

# lty: twodash, longdash, dotdash, dotted, dashed, solid, blank
plot(xs.less, xlab='prob', dbeta(xs.less, 1, 41), type='l', col='red') # Use this one: weak prior, easier to change with more data
lines(xs.less, dbeta(xs.less, 2, 80), lty='dotted', col='blue', )
lines(xs.less, dbeta(xs.less, 5, 200), lty='longdash', col='green')

plot(xs.less, pbeta(xs.less, 1, 41), type='l')

selectedTruePrior = 1
selectedFalsePrior = 41

# Beta(αposterior, βposterior) = Beta(αlikelihood + αprior, βlikelihood + βprior)
plot(xs, dbeta(xs, trueValues + selectedTruePrior, falseValues + selectedFalsePrior), ylab='Density', xlab='Conversion rate', type='l', col='blue')
lines(xs, dbeta(xs, trueValues, falseValues), type='l')

lines(xs, dbeta(xs, 25 + selectedTruePrior, 75 + selectedFalsePrior), type='l', col='green')
lines(xs, dbeta(xs, 25, 75), type='l')

# More collected data...
# "the more data we gather, the more our prior beliefs become diminished by evidence"
plot(xs, dbeta(xs, 86 + selectedTruePrior, 300 - 86 + selectedFalsePrior), type='l', col='red')
lines(xs, dbeta(xs, 86, 300 - 86), type='l', col='cyan', )
grid(col='black')


# Non-informative prior
plot(xs, dbeta(xs, 1, 1), type='l')

plot(xs, dbeta(xs, 1, 2), type='l')
grid(col='black')

plot(xs, pbeta(xs, 1, 2), type='l')
grid(col='black')


# EXERCISES
# 1
# a
lines(xs, dbeta(xs, 7, 3), type='l')
# b
plot(xs, dbeta(xs, 1000, 1000), type='l')
# c
lines(xs, dbeta(xs, 70, 30), type='l')

# 2
# a 
qbeta(.975, 7+9+9, 3+3+11)
qbeta(.025, 7+9+9, 3+3+11)
# b 
qbeta(.975, 1000+9+9, 1000+3+11)
qbeta(.025, 1000+9+9, 1000+3+11)
#c 
qbeta(.975, 70+9+9, 30+3+11)
qbeta(.025, 70+9+9, 30+3+11)
