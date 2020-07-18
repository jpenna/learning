xs = seq(0.1, 0.6, by=0.001)

# prior
plot(xs, dbeta(xs, 3,7), type='l')

# with likelihood
aClick = 36
aNot = 114

bClick = 50
bNot = 100

# a
plot(xs, dbeta(xs, 36+3, 114+7), type='l', col='red')
# mean
39 / (39 + 121)

# b
lines(xs, dbeta(xs, 50+3, 100+7), type='l', col='blue')
grid(col='black')
# mean
53 / (53 + 107)

legend(.5, 10, legend=c("A (pic)", "B (no pic)"), fill=c("red", "blue"))

# MONTE CARLO SIMULATIONS
# A Monte Carlo simulation is any technique that makes use of random sampling to solve a problem.
n.trials = 100000
prior.alpha = 3
prior.beta = 7

a.samples = rbeta(n.trials, 36+prior.alpha, 114+prior.beta)
b.samples = rbeta(n.trials, 50+prior.alpha, 100+prior.beta)

p.b_superior = sum(b.samples > a.samples) / n.trials

# 1.4 is the highest, probably a 40% improvement in B compared to A
hist(b.samples / a.samples, plot=TRUE)

# empirical cumulative distribution function
plot.ecdf(ecdf(b.samples / a.samples), 
          main="Empirical Cumulative Distribution Function",
          xlab="Improvement",
          ylab="Cumulative Probability")
abline(v=1, lty='dashed')
grid(col='gray')
# Smaller than 1 means A is better. Even if it is better, it isn't by much

##########################################
##########     Exercise 2    #############
##########################################
a.prior.alpha = 30
a.prior.beta = 70

b.prior.alpha = 20
b.prior.beta = 80

# a
plot(xs, dbeta(xs, 36+3, 114+7), type='l', col='red')
# mean
a.prior.alpha / (a.prior.alpha + a.prior.beta)

# b
lines(xs, dbeta(xs, 50+3, 100+7), type='l', col='blue')
grid(col='black')
# mean
b.prior.alpha / (b.prior.alpha + b.prior.beta)

a.samples = rbeta(n.trials, 36+a.prior.alpha, 114+a.prior.beta)
b.samples = rbeta(n.trials, 50+b.prior.alpha, 100+b.prior.beta)

p.b_superior = sum(b.samples > a.samples) / n.trials

# 1.4 is the highest, probably a 40% improvement in B compared to A
hist(b.samples / a.samples, plot=TRUE)

# empirical cumulative distribution function
plot.ecdf(ecdf(b.samples / a.samples), 
          main="Empirical Cumulative Distribution Function",
          xlab="Improvement",
          ylab="Cumulative Probability")
abline(v=1, lty='dashed')
grid(col='gray')


##########################################
##########     Exercise 3    #############
##########################################

# Each run will give different results, because this is a simulation
a.true.rate = 0.25 
b.true.rate = 0.3

number.of.samples = 1000 

a.results = runif(number.of.samples / 2) <= a.true.rate
b.results = runif(number.of.samples / 2) <= b.true.rate

a.samples = rbeta(n.trials, sum(a.results)+prior.alpha, sum(a.results==FALSE)+prior.beta)
b.samples = rbeta(n.trials, sum(b.results)+prior.alpha, sum(b.results==FALSE)+prior.beta)

sum(b.samples > a.samples) / n.trials

