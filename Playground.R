set.seed(20)
x <- rnorm(10)
e <- rnorm(10, 0, 2)
y <- 0.5 + 2 * x + e

summary (y)

plot (x, y)

set.seed(20)
x <- rnorm(10)
log.mu <- 0.5 + 0.3 * x
y <- rpois(10, exp(log.mu))

summary (y)

plot (x, y)


Rprof("test.out")
lm(x~y)
Rprof(NULL)

Rprof("test.out")
summaryRprof("test.out")