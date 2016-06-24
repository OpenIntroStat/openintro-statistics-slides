setwd("/Users/mine/Desktop/Teaching/Sta 101 - F11/Lectures/Lecture 16/6-1smallMean/figures/tDistCompareToNormalDist")

pdf('tDistCompareToNormalDist.pdf', 4.5, 2)

par(mar=c(2, 1, 1, 1), mgp=c(5, 0.6, 0))
plot(c(-4, 4), c(0, dnorm(0)), type='n', axes=FALSE)
axis(1)
abline(h=0)

X <- seq(-5, 5, 0.01)
Y <- dnorm(X)
lines(X, Y, lty=3, lwd=2)

Y <- dt(X, 2)
lines(X, Y, lwd=1.5, col = "#225588")

legend("topright", inset = 0.05, lty = c(3,1), lwd = c(2,1.5), c("normal","t"), col = c("black","#225588"), bty = "n")

dev.off()
