library(openintro)

setwd("~/Desktop/Teaching/Sta 101 - F13/Slides/(3) Unit 3/Lec 3/figures/power")

myPDF("powerProblem1.pdf", 6, 3, mar=c(3.9, 0.5, 0.5, 0.5))

normTail(U = 1.65, col = COL[1], axes = FALSE)
axis(1, at = c(-3,0,1.65,3), labels = c(NA, 130, 130 + 1.65 * 2.5, NA), cex.axis = 1.5)
text(x = 2.5, y = 0.05, "0.05", col = "red", cex = 1.5)

dev.off()

#

myPDF("powerProblem2.pdf", 6, 3, mar=c(3.9, 0.5, 0.5, 0.5))

normTail(U = 0.85, col = COL[1], axes = FALSE)
axis(1, at = c(-3,0,0.85,3), labels = c(NA, 132, 134.125, NA), cex.axis = 1)
text(x = 0, y = 0.1, "0.8023", cex = 1.5)
text(x = 1.38, y = 0.05, "0.1977", col = "white", cex = 1.5)

dev.off()

#

X    <- seq(119, 141, length.out=500)
Y0   <- dnorm((X-130)/2.5)
Y115 <- dnorm((X-132)/2.5)
ylim <- range(Y0)
COL  <- c('#558822CC', '#225588', '#88225528', '#22558844')


myPDF("power1.pdf", 6, 3, mar=c(3.9, 0.5, 0.5, 0.5))

plot(X, Y0, type='l', col=COL[1], axes=FALSE, xlab='Systolic blood pressure', ylab='', ylim=ylim*1.1)
abline(v=130,col=COL[1],lty=2)

axis(1)
abline(h=0)

arrows(124, ylim[2]*.8, 126.5, ylim[2]*.6, length=0.1, col=COL[1])
text(123, ylim[2]*.8, "Null\ndistribution", pos=3, col=COL[1])

dev.off()

myPDF("power2.pdf", 6, 3, mar=c(3.9, 0.5, 0.5, 0.5))

plot(X, Y0, type='l', col=COL[1], axes=FALSE, xlab='Systolic blood pressure', ylab='', ylim=ylim*1.1)
abline(v=130,col=COL[1],lty=2)

lines(X, Y115, col=COL[2])
abline(v=132,col=COL[2],lty=2)

axis(1)
abline(h=0)

arrows(124, ylim[2]*.8, 126.5, ylim[2]*.6, length=0.1, col=COL[1])
text(123, ylim[2]*.8, "Null\ndistribution", pos=3, col=COL[1])

arrows(138, ylim[2]*.8, 135.5, ylim[2]*.6, length=0.1, col=COL[2])
text(139, ylim[2]*.8, "Power\ndistribution", pos=3, col=COL[2])

dev.off()


myPDF("power3.pdf", 6, 3, mar=c(3.9, 0.5, 0.5, 0.5))

plot(X, Y0, type='l', col=COL[1], axes=FALSE, xlab='Systolic blood pressure', ylab='', ylim=ylim*1.1)
abline(v=130,col=COL[1],lty=2)

lines(X, Y115, col=COL[2])
abline(v=132,col=COL[2],lty=2)

axis(1)
abline(h=0)

arrows(124, ylim[2]*.8, 126.5, ylim[2]*.6, length=0.1, col=COL[1])
text(123, ylim[2]*.8, "Null\ndistribution", pos=3, col=COL[1])

arrows(138, ylim[2]*.8, 135.5, ylim[2]*.6, length=0.1, col=COL[2])
text(139, ylim[2]*.8, "Power\ndistribution", pos=3, col=COL[2])

these <- (X >= 134.125)
Xhold <- c(134.125, X[these])
Yhold <- c(0, Y0[these])
polygon(Xhold, Yhold, col=COL[1], border='#00000000')

text(134.9,-0.01,"0.05",pos=3,cex=0.75)

dev.off()


myPDF("power4.pdf", 6, 3, mar=c(3.9, 0.5, 0.5, 0.5))

plot(X, Y0, type='l', col=COL[1], axes=FALSE, xlab='Systolic blood pressure', ylab='', ylim=ylim*1.1)
abline(v=130,col=COL[1],lty=2)

lines(X, Y115, col=COL[2])
abline(v=132,col=COL[2],lty=2)

axis(1)
abline(h=0)

arrows(124, ylim[2]*.8, 126.5, ylim[2]*.6, length=0.1, col=COL[1])
text(123, ylim[2]*.8, "Null\ndistribution", pos=3, col=COL[1])

arrows(138, ylim[2]*.8, 135.5, ylim[2]*.6, length=0.1, col=COL[2])
text(139, ylim[2]*.8, "Power\ndistribution", pos=3, col=COL[2])

these <- (X >= 134.125)
Xhold <- c(134.125, X[these])
Yhold <- c(0, Y0[these])
polygon(Xhold, Yhold, col=COL[1], border='#00000000')

text(134.9,-0.01,"0.05",pos=3,cex=0.75)

arrows(133, ylim[2]*.075, 134, ylim[2]*.075, length=0.1, col=COL[2])
text(133.25,ylim[2]*.075,"134.125",pos=2,cex=0.75)

dev.off()

###

myPDF("power5.pdf", 6, 3, mar=c(3.9, 0.5, 0.5, 0.5))

plot(X, Y0, type='l', col=COL[1], axes=FALSE, xlab='Systolic blood pressure', ylab='', ylim=ylim*1.1)
abline(v=130,col=COL[1],lty=2)

lines(X, Y115, col=COL[2])
abline(v=132,col=COL[2],lty=2)

axis(1)
abline(h=0)

arrows(124, ylim[2]*.8, 126.5, ylim[2]*.6, length=0.1, col=COL[1])
text(123, ylim[2]*.8, "Null\ndistribution", pos=3, col=COL[1])

arrows(138, ylim[2]*.8, 135.5, ylim[2]*.6, length=0.1, col=COL[2])
text(139, ylim[2]*.8, "Power\ndistribution", pos=3, col=COL[2])

lines(x = c(134.125,134.125), y = c(0,Y115[these][1]), col = COL[2])

these <- (X >= 134.125)
Xhold <- c(134.125, X[these])
Yhold <- c(0, Y0[these])
polygon(Xhold, Yhold, col=COL[1], border='#00000000')

text(134.9,-0.01,"0.05",pos=3,cex=0.75)

arrows(133, ylim[2]*.075, 134, ylim[2]*.075, length=0.1, col=COL[2])
text(133.25,ylim[2]*.075,"134.125",pos=2,cex=0.75)

dev.off()


###

myPDF("power6.pdf", 6, 3, mar=c(3.9, 0.5, 0.5, 0.5))

plot(X, Y0, type='l', col=COL[1], axes=FALSE, xlab='Systolic blood pressure', ylab='', ylim=ylim*1.1)
abline(v=130,col=COL[1],lty=2)

lines(X, Y115, col=COL[2])
abline(v=132,col=COL[2],lty=2)

axis(1)
abline(h=0)

arrows(124, ylim[2]*.8, 126.5, ylim[2]*.6, length=0.1, col=COL[1])
text(123, ylim[2]*.8, "Null\ndistribution", pos=3, col=COL[1])

arrows(138, ylim[2]*.8, 135.5, ylim[2]*.6, length=0.1, col=COL[2])
text(139, ylim[2]*.8, "Power\ndistribution", pos=3, col=COL[2])

these <- (X >= 134.125)
Xhold <- c(134.125, X[these])
Yhold <- c(0, Y115[these])
polygon(Xhold, Yhold, col=COL[2], border='#00000000')

text(136,ylim[2]*.0025,"Power",pos=3, col = "white")


dev.off()




