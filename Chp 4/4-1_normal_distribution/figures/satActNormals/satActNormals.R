setwd("/Users/mine/Desktop/Teaching/Sta 101 - S12/Lectures/Lecture 6/3-1normalDist/figures/satActNormals")

pdf('satActNormals.pdf', width = 10, height = 4)

par(mfrow=c(1,2), mar=c(2.1,0,0,0), cex = 1.25)
m = 1500
s = 300
normTail(m = 1500, s = 300)
lines(c(m,m), dnorm(m, m, s)*c(0.01,0.99), lty=2, col='#EEEEEE')
lines(c(m,m)+s, dnorm(m+s, m, s)*c(0.01,1.25), lty=2, col='#335588')
text(m+s, dnorm(m+s,m,s)*1.25, 'Pam', pos=3, col='#335588')

m = 21
s = 5
normTail(m = 21, s = 5)
lines(c(m,m), dnorm(m, m, s)*c(0.01,0.99), lty=2, col='#EEEEEE')
lines(c(24,24), dnorm(m+3, m, s)*c(0.01,1.04), lty=2, col="red")
text(24, dnorm(24,m,s)*1.05, 'Jim', pos=3, col="red")

dev.off()


#######

pdf('satActNormalsStandardized.pdf', 6, 3)

par(mfrow=c(1,1), las=1, mar=c(2,0.5,0,0.5))

m <- 0
s <- 1
X <- m+s*seq(-4,4,0.01)
Y <- dnorm(X, m, s)
plot(X, Y, type='l', axes=F, xlim=m+s*c(-2.7,2.7))
axis(1, at=m+s*(-3:3))
abline(h=0)
lines(c(m,m), dnorm(m, m, s)*c(0.01,0.99), lty=2, col='#EEEEEE')
lines(c(m,m)+s, dnorm(m+s, m, s)*c(0.01,1.5), lty=2, col='#335588')
lines(c(m,m)+0.6*s, dnorm(m+0.6*s, m, s)*c(0.01,1.1), lty=2, col="red")
text(m+s, dnorm(m+s,m,s)*1.5, 'Pam', pos=3, col='#335588')
text(m+0.6*s, dnorm(m+0.6*s,m,s)*1.1, 'Jim', pos=3, col="red")

dev.off()

