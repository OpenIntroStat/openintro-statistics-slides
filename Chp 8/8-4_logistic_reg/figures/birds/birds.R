library(openintro)
data(COL)

library(Sleuth3)

birds = case2002


birds$pch = NA

birds$pch[birds$LC == "LungCancer" & birds$BK == "Bird"] = 17
birds$pch[birds$LC == "LungCancer" & birds$BK == "NoBird"] = 16
birds$pch[birds$LC == "NoCancer" & birds$BK == "Bird"] = 2
birds$pch[birds$LC == "NoCancer" & birds$BK == "NoBird"] = 1

birds$col[birds$LC == "LungCancer"] = COL[2,2]
birds$col[birds$LC == "NoCancer"] = COL[1,2]


# birds

pdf("birds.pdf", height = 4, width = 8)

par(mar=c(2,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(YR~AG, data = birds, pch = birds$pch, col = birds$col, lwd = 2)

dev.off()

# odds ratios

p = (1:99)/100

f = function(p) (3.91 * p/(1-p))/(1+3.91 * p/(1-p))

pdf("OR1.pdf",width=4,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)

plot(p,f(p),xlab="P(lung cancer | no birds)",ylab="P(lung cancer | birds)",type="l")
abline(a=0,b=1,col='lightgrey')

dev.off()

pdf("OR2.pdf",width=4,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)

plot(p,f(p),xlab="P(lung cancer | no birds)",ylab="P(lung cancer | birds)",type="l")
abline(a=0,b=1,col='lightgrey')

points(0.05,f(0.05),col='red',pch=16)
lines(c(0.05,0.05),c(0,f(0.05)),col='red')

dev.off()

pdf("OR3.pdf",width=4,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)

plot(p,f(p),xlab="P(lung cancer | no birds)",ylab="P(lung cancer | birds)",type="l")
abline(a=0,b=1,col='lightgrey')

points(0.05,f(0.05),col='red',pch=16)
lines(c(0.05,0.05),c(0,f(0.05)),col='red')
lines(c(-1,0.05),c(f(0.05),f(0.05)),col='red')

dev.off()