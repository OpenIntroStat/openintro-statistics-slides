library(openintro)
data(COL)

#

myPDF('fb_power_user.pdf', 5.5, 4.1, mar=c(3.9, 3, 0.5, 1), mgp=c(2.2, 0.6, 0))

p = 0.25
n = 245 
k = 0:245
pk = dbinom(k, n, p)
plot(k,pk,type='s',xlim=c(20, 100), axes = FALSE, xlab = "k", ylab = "")
axis(1)
axis(2)
lines(k, dnorm(k, mean = n*p, s = sqrt(n*p*(1-p))), type = "l", col = COL[1])
X <- c(70, 70:245, 245)
Y <- c(0, dnorm(70:245, n*p, sqrt(n*p*(1-p))), 0)
polygon(X, Y, border = COL[1], col = COL[1,3])
legend("topleft", lty = c(1,1), lwd = c(1,3), col = c(COL[5], COL[1]), legend = c("Bin(245,0.25)", "N(61.5,6.78)"), inset = 0.05)

dev.off()

#

myPDF('fb_power_user_norm.pdf', 5.5, 4.1, mar=c(2, 2, 0.5, 0.5), mgp=c(2.2, 0.6, 0))

normTail(61.25, 6.78, U = 70, axes = FALSE, col = COL[1,3])
axis(1, at = c(61.25 - 3*6.78, 61.25, 70, 61.25 + 3*6.78), labels =c(NA,"61.25","70",NA), cex.axis = 1.25)

dev.off()

#

myPDF('fbpoweruser_correct.pdf', 5.5, 4.1, mar=c(3.9, 3, 0.5, 1), mgp=c(2.2, 0.6, 0))

p = 0.25
n = 245 
k = 0:245
pk = dbinom(k, n, p)
plot(k,pk,type='s',xlim=c(20, 100), axes = FALSE, xlab = "k", ylab = "")
axis(1)
axis(2)
lines(k, dnorm(k, mean = n*p, s = sqrt(n*p*(1-p))), type = "l", col = "#225588")
X <- c(70, 70:245, 245)
Y <- c(0, dnorm(70:245, n*p, sqrt(n*p*(1-p))), 0)
polygon(X, Y, border = "#225588", col = "#22558844")
legend("topleft", lty = c(1,1), lwd = c(1,3), col = c("black", "#225588"), legend = c("Bin(245,0.25)", "N(61.5,6.78)"), inset = 0.05)
lines(c(245, 69.5, 69.5:245), c(0, 0, dnorm(69.5:245, n*p, sqrt(n*p*(1-p)))), , col = "red", lwd = 2)

dev.off()

#

