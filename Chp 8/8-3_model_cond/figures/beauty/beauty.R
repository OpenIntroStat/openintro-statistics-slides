library(openintro)
library(xtable)
data(COL)

d = read.csv(file = "beauty.csv")

# final model

m_final = lm(profevaluation ~ beauty + gender + age + formal + native + tenure, data = d)


# nearly normal residuals

pdf("normal_res.pdf", height = 4.3, width = 10)

par(mar=c(2,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(1,2))

qqnorm(m_final$residuals, main = "Normal probability plot of residuals", pch = 19, col = COL[1,2])
qqline(m_final$residuals, col = COL[1], lwd = 2)

hist(m_final$residuals, main = "Histogram of residuals", col = COL[1])

dev.off()

# constant variability in residuals

pdf("homo_res.pdf", height = 4.3, width = 10)

par(mar=c(4,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(1,2))

plot(m_final$residuals ~ m_final$fitted, main = "Residuals vs. fitted", pch = 19, col = COL[1,2], ylab = "residuals", xlab = "fitted")
abline(h = 0, lty = 3)

plot(abs(m_final$residuals) ~ m_final$fitted, main = "Absolute value of residuals vs. fitted", pch = 19, col = COL[1,2], ylab = "abs(residuals)", xlab = "fitted")

dev.off()

# independent residuals

pdf("indep_res.pdf", height = 4.3, width = 10)

par(mar=c(4,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(1,1))

plot(m_final$residuals, main = "Residuals vs. order of data collection", pch = 19, col = COL[1,2], ylab = "residuals", xlab = "order of data collection")

abline(h = 0, lty = 3)

dev.off()

# linear relatiopnships

pdf("linear.pdf", height = 4.3, width = 10)

par(mar=c(4,4,1,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(1,2))

plot(m_final$residuals ~ d$beauty, pch = 19, col = COL[1,2], xlab = "beauty", ylab = "professor evaluation")
abline(h = 0, lty = 3)

plot(m_final$residuals ~ d$age, pch = 19, col = COL[1,2], xlab = "age", ylab = "professor evaluation")
abline(h = 0, lty = 3)

dev.off()