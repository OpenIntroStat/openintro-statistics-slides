library(openintro)
data(COL)

set.seed(195)
x1 <- c(rchisq(65, 3), 20)
x2 <- c(rnorm(100, 35, 10), rnorm(3, 100,3))

pdf("outlierPlots.pdf", width = 7, height = 3)

par(mfrow=c(1,2), mar=c(1.9, 2, 1, 2), mgp=c(2.4, 0.7, 0))

histPlot(x1, axes=FALSE, xlab='', ylab='', col=COL[1])
axis(1)
axis(2)

histPlot(x2, axes=FALSE, xlab='', ylab='', col=COL[1])
axis(1)
axis(2)

dev.off()