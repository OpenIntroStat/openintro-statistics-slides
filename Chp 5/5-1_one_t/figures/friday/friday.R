# data from: http://lib.stat.cmu.edu/DASL/Datafiles/Fridaythe13th.html
library(openintro)

setwd("/Users/mine/Desktop/Teaching/Sta 101 - F11/Lectures/Lecture 16/6-1smallMean/figures/friday")

friday = read.csv("friday.csv", h = T, na.strings = "")


# histogram

myPDF("trafficHist.pdf", 1.1*5.5, 3.3, mar=c(3,3,0.15,1), mgp=c(2.4,0.7,0))

histPlot(friday$diff[friday$type == "traffic"], col="#22558833", border="#225588", xlab = "Difference in traffic flow")

dev.off()


# statistics

mean(friday$diff[friday$type == "traffic"])

sd(friday$diff[friday$type == "traffic"])

# p-value

myPDF('fridayPvalue.pdf', 4, 2, mar=c(1.6,1,0.1,1), mgp=c(5,0.45,0))

plot(c(-4, 4), c(0, dnorm(0)), type='n', axes=FALSE, ylab = "", xlab = "")
axis(1, at = c(-5, -3.25, 0, 3.25, 5), labels = c(NA, "- 1836", expression(paste(mu[diff], "= 0")), expression(paste(bar(x)[diff],"= 1836")),NA))
abline(h=0)

X <- seq(-8, 8, 0.01)
Y <- dt(X, 9)
lines(X, Y, col=COL[1])

these <- which(X > 3.25)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col='#22558833', border='#225588')

these <- which(X < -3.25)
yy <- c(0, Y[these], 0)
these <- c(these[1], these, rev(these)[1])
xx <- X[these]
polygon(xx, yy, col='#22558833', border='#225588')

text(3,0.8*max(Y),"df = 9", cex = 0.9)

dev.off()

# t.test
trafficDiff = friday$diff[friday$type == "traffic"]

t.test(trafficDiff, mu = 0, alternative = "two.sided")
