poverty = read.table("poverty.txt", h = T, sep = "\t")

library(openintro)
data(COL)

# scatterplot

pdf("poverty_hsgrad.pdf", 5.5, 4.3)
par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)
plot(poverty$Poverty ~ poverty$Graduates, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2])
dev.off()

# scatterplot, with line

pdf("poverty_hsgrad_line.pdf", 5.5, 4.3)
par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)
plot(poverty$Poverty ~ poverty$Graduates, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2])
lm_pov_grad = lm(poverty$Poverty ~ poverty$Graduates)
abline(lm_pov_grad, col = COL[4], lwd = 3)
dev.off()

# scatterplot, %poverty vs.%no husband

pdf("poverty_nohusband.pdf", 5.5, 4.3)
par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)
plot(poverty$Poverty ~ poverty$PercentFemaleHouseholderNoHusbandPresent, ylab = "% in poverty", xlab = "% female householder, no husband present", pch=19, col=COL[1,2])
dev.off()