library(openintro)
data(COL)

library(xtable)

library(DAAG)
data(allbacks)

# scatterplot: weight vs. volume

m1 = lm(weight ~ volume, data = allbacks)
summary(m1)

pdf("weight_volume.pdf", height = 4.3, width = 5.5)

par(mar=c(4,4,1,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(weight ~ volume, data = allbacks, pch = 19, col = COL[1,2], xlab = expression(volume~(cm^{3})), ylab = "weight (g)")
abline(m1, lwd = 3, col = COL[4])
text(x = 600, y = 1000, expression(paste(widehat(weight)," = 108 + 0.7 volume")), cex = 1.25, col = COL[1], pos = 1)
text(x = 600, y = 900, expression(paste(R^{2},"= 80%")), cex = 1.25, col = COL[1], pos = 1)

dev.off()

# scatterplot: weight vs. volume and cover

ch = rep(NA, dim(allbacks)[1])
ch[allbacks$cover == "hb"] = 15
ch[allbacks$cover == "pb"] = 17

color = rep(NA, dim(allbacks)[1])
color[allbacks$cover == "hb"] = COL[1,2]
color[allbacks$cover == "pb"] = COL[2,2]

pdf("weight_volume_cover.pdf", height = 4.3, width = 5.5)

par(mar=c(4,4,0.25,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(weight ~ volume, data = allbacks, col = color, xlab = expression(volume~(cm^{3})), ylab = "weight (g)", pch = ch)
legend("topleft", inset = 0.05, c("hardcover","paperback"), col = c(COL[1,2],COL[2,2]), pch = c(15,17))

dev.off()

# regression model

m2 <- lm(weight ~ volume + cover, data = allbacks)
summary(m2)

# scatterplot: weight vs. volume and cover with lines

pdf("weight_volume_cover_lines.pdf", height = 4.3, width = 5.5)

par(mar=c(4,4,0.25,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(weight ~ volume, data = allbacks, col = color, xlab = expression(volume~(cm^{3})), ylab = "weight (g)", pch = ch)
legend("topleft", inset = 0.05, c("hardcover","paperback"), col = c(COL[1,2],COL[2,2]), pch = c(15,17))
abline(a = m2$coefficients[1], b = m2$coefficients[2], col = COL[1], lwd = 2)
abline(a = m2$coefficients[1] + m2$coefficients[3], b = m2$coefficients[2], col = COL[2], lwd = 2, lty = 2)

dev.off()


