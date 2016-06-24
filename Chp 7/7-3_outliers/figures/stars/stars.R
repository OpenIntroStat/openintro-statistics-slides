library(faraway)

library(openintro)
data(COL)

data(star)

pdf("star.pdf", height = 4.3, width = 5.5)

par(mar=c(4,4,2,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(light ~ temp, data = star, pch=19, col=COL[1,2], xlab = "log(temp)", ylab = "log(light intensity)")

abline(lm(light[temp>4]~temp[temp>4], data = star), col = COL[4], lwd = 3)
abline(lm(light~temp, data = star), col = COL[2], lwd = 3, lty = 2)

legend("top", inset = 0.05, c("w/ outliers","w/o outliers"), lty = c(2,1), lwd = c(2,3), col = c(COL[2],COL[4]))

dev.off()