# data from: http://lib.stat.cmu.edu/DASL/Datafiles/Fridaythe13th.html
library(openintro)

setwd("/Users/mine/Desktop/Teaching/Sta 101 - F11/Lectures/Lecture 16/6-1smallMean/figures/middle95")

# 1

myPDF('middle95_1.pdf', 4, 2, mar=c(1.6,1,0.1,1), mgp=c(5,0.45,0))

plot(c(-4, 4), c(0, dnorm(0)), type='n', axes=FALSE, ylab = "", xlab = "")
axis(1, at = c(-5, 0, 2.26, 5), labels = c(NA, 0, "t* = ?",NA))
abline(h=0)

X <- seq(-8, 8, 0.01)
Y <- dt(X, 9)
lines(X, Y, col=COL[1])

these <- which(X > 2.26)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col='#22558833', border='#225588')

these <- which(X < -2.26)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col='#22558833', border='#225588')

text(3,0.8*max(Y),"df = 9", cex = 0.9)
text(0,0.6*max(Y), "95%", col = "red", cex = 0.9)

dev.off()

#

myPDF('middle95_2.pdf', 4, 2, mar=c(1.6,1,0.1,1), mgp=c(5,0.45,0))

plot(c(-4, 4), c(0, dnorm(0)), type='n', axes=FALSE, ylab = "", xlab = "")
axis(1, at = c(-5, -2.26, 0, 2.26, 5), labels = c(NA, "t = -2.26", 0, "t* = 2.26",NA))
abline(h=0)

X <- seq(-8, 8, 0.01)
Y <- dt(X, 9)
lines(X, Y, col=COL[1])

these <- which(X > 2.26)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col='#22558833', border='#225588')

these <- which(X < -2.26)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col='#22558833', border='#225588')

text(3,0.8*max(Y),"df = 9", cex = 0.9)
text(0,0.6*max(Y), "95%", col = "red", cex = 0.9)

dev.off()
