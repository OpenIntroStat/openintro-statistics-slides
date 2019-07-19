library(openintro)
data(COL)

set.seed(234)
x1 <- rchisq(65, 3)
x2 <- c(runif(20, 0,10), rnorm(100, 16.5, 2))
x3 <- rnorm(100, 35, 12)

pdf("skewedSymPlots.pdf", width = 7, height = 3)

par(mfrow=c(1,3), mar=c(1.9, 2, 1, 2), mgp=c(2.4, 0.7, 0))

histPlot(x1, axes=FALSE, xlab='', ylab='', col=COL[1])
axis(1)
axis(2)

histPlot(x2, axes=FALSE, xlab='', ylab='', col=COL[1])
axis(1)
axis(2)

histPlot(x3, axes=FALSE, xlab='', ylab='', col=COL[1])
axis(1)
axis(2)

dev.off()