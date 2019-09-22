
#===> plot <===#
par(las=1, mar=c(2.5,0,0.3,0))
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y, type='n', axes=F, ylim=c(0,0.4), xlim=c(-3.2,3.2))
abline(h=0, col='#AAAAAA')
axis(1, at=-3:3, label=expression(mu-3*sigma,mu-2*sigma,mu-sigma,mu,
	mu+sigma,mu+2*sigma,mu+3*sigma))
COL <- c('#DFF0E8', '#CFC8D8', '#B8AFA8')
for(i in 3:1){
	these <- (X>=-i & X <= i)
	polygon(c(-i,X[these],i),c(0,Y[these],0), col=COL[i], border=COL[i])
}
#lines(c(0,0),c(0,dnorm(0)), col='#888888')

#===> label 99.7 <===#
arrows(-3,0.03, 3,0.03, code=3, col='#666666', length=0.15)
#lines(c(-3,-3), c(0,0.03), lty=3, col='#888888')
#lines(c(3,3), c(0,0.03), lty=3, col='#888888')
text(0, 0.02, '99.7%', col='#333333', pos=3)

#===> label 95 <===#
arrows(-2,0.13, 2,0.13, code=3, col='#666666', length=0.15)
#lines(c(-2,-2), c(0,0.13), lty=3, col='#888888')
#lines(c(2,2), c(0,0.13), lty=3, col='#888888')
text(0, 0.12, '95%', col='#333333', pos=3)

#===> label 68 <===#
arrows(-1,0.23, 1,0.23, code=3, col='#666666', length=0.15)
#lines(c(-1,-1), c(0,0.23), lty=3, col='#888888')
#lines(c(1,1), c(0,0.23), lty=3, col='#888888')
text(0, 0.22, '68%', col='#333333', pos=3)

lines(X, Y, col='#888888')
abline(h=0, col='#AAAAAA')

