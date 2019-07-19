library(openintro)
data(COL)

library(faraway)

data(twins)

r = cor(twins$Foster, twins$Biological)
m1 = lm(twins$Foster ~ twins$Biological)

pdf("twins_IQ.pdf", height = 4, width = 6)
par(mar=c(4.5,4.5,0.5,0.5))
plot(twins$Foster ~ twins$Biological, xlab = "biological IQ", ylab = "foster IQ", pch = 20, col = COL[1,2], cex = 1.25, las = 1, cex.axis = 1.5, cex.lab = 1.5)
abline(m1, col = COL[4], lwd = 2)
text(paste("R = ", round(r,3)), x = 75, y = 125, cex = 1.5)
dev.off()


summary(m1)