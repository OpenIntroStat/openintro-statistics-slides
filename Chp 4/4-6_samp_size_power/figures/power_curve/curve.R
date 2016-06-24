library(openintro)
data(COL)

n=1:1000
power = 1-pnorm(1.65-4*sqrt(n)/25)

i=which.min(abs(power-0.9))

pdf("power_curve1.pdf",width=10,height=5)
par(mar=c(5, 4, 2, 2) + 0.1, cex.axis = 1.5, cex.lab = 1.5)
plot(n,power,type='l',lwd=3)
dev.off()

pdf("power_curve2.pdf",width=10,height=5)
par(mar=c(5, 4, 2, 2) + 0.1, cex.axis = 1.5, cex.lab = 1.5)
plot(n,power,type='l',lwd=3)
abline(h=power[i],col=COL[4],lwd=2)
dev.off()

pdf("power_curve3.pdf",width=10,height=5)
par(mar=c(5, 4, 2, 2) + 0.1, cex.axis = 1.5, cex.lab = 1.5)
plot(n,power,type='l',lwd=3)
abline(h=power[i],col=COL[4],lwd=2)
abline(v=i,col=COL[1],lwd=2)
dev.off()