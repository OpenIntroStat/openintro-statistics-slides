library(openintro)
data(COL)

set.seed(51)
x1 <- rchisq(65, 6)
x2 <- c(rchisq(22, 5.8), rnorm(40, 16.5, 2))
x3 <- c(rchisq(20, 3), rnorm(35, 12), rnorm(42, 18, 1.5))
x4 <- runif(100,0,20)

pdf("singleBiMultiModalUnifPlots.pdf", width = 7, height = 2)

par(mfrow=c(1,4), mar=c(1.9, 2, 1, 2), mgp=c(2.4, 0.7, 0))

histPlot(x1, axes=FALSE, xlab='', ylab='', col=COL[1])
axis(1)
axis(2)

histPlot(x2, axes=FALSE, xlab='', ylab='', col=COL[1])
axis(1)
axis(2)

histPlot(x3, axes=FALSE, xlab='', ylab='', col=COL[1])
axis(1)
axis(2)

histPlot(x4, axes=FALSE, xlab='', ylab='', col=COL[1])
axis(1)
axis(2)

dev.off()