#===> plot <===#
par(mfrow=c(1,1), las=1, mar=0.5*c(1,1,1,1))

# curve 1
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='l', axes=F, xlim=c(-3.4,3.4), col='#335588', lwd=2)
#axis(1, at=-3:3)
abline(h=-0.002, col='#888888')
