library(openintro)
data(COL)


set.seed(238)

n <- c(50, 25, 78, 55, 70, 150)
m <- c(12, -4, 7, -19, 0, 40)
xr <- list(0.3, c(2), 1.42,
	runif(4,1.45,1.55), 5.78, -0.6)
yr <- list(-4, c(-8), 19,
	c(-17,-20,-21,-19), 12, -23.2)
for(i in 1:3){
	x <- runif(n[i])
	y <- m[i]*x + rnorm(n[i])
	#temp = lm(y~x)
	x <- c(x,xr[[i]])
	y <- c(y,yr[[i]])
	pdf(paste("out",i,".pdf",sep=""), height = 6, width = 5.5)
	par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.5,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(2,1))
	lmPlot(x, y, col = COL[1,2], lCol = COL[4], lwd = 3)
	#abline(temp, lty = 3)
	dev.off()
}
for(i in 4:6){
	x <- runif(n[i])
	y <- m[i]*x + rnorm(n[i])
	x <- c(x,xr[[i]])
	y <- c(y,yr[[i]])
	pdf(paste("out",i,".pdf",sep=""), height = 6, width = 5.5)
	par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.5,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(2,1))
	lmPlot(x, y, col = COL[1,2], lCol = COL[4], lwd = 3)
	dev.off()
}

i = 5
x <- runif(n[i])
y <- m[i]*x + rnorm(n[i])
x <- c(x,xr[[i]])
y <- c(y,yr[[i]])
pdf(paste("out5-1.pdf",sep=""), height = 6, width = 5.5)
par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.5,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(2,1))
lmPlot(x[1:70], y[1:70], col = COL[1,2], lCol = COL[4], lwd = 3, xlim = range(x), ylim = range(y))
dev.off()