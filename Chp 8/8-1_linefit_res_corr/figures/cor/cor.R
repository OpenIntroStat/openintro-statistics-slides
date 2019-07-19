
set.seed(179)

# 4 scatterplots

x = seq(0,10,0.1)
yNonLin = (x-3)^2 - 4 + rnorm(length(x), mean = 0, sd = 1)
yPosLinStrong = 3*x + 10 + rnorm(length(x), mean = 0, sd = 2)
yPosLinWeak = 3*x + 10 + rnorm(length(x), mean = 0, sd = 20)
yNegLinWeak = -3*x + 10 + rnorm(length(x), mean = 0, sd = 5)

pdf("cor.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.5,0.7,0), mfrow = c(2,2), cex.lab = 1.5, cex.axis = 1.5)

plot(yNonLin ~ x, ylab = "", xlab = "(a)", pch=19, col=COL[1,2], axes = FALSE)
box()

plot(yPosLinStrong ~ x, ylab = "", xlab = "(b)", pch=19, col=COL[1,2], axes = FALSE)
box()

plot(yPosLinWeak ~ x, ylab = "", xlab = "(c)", pch=19, col=COL[1,2], axes = FALSE)
box()

plot(yNegLinWeak ~ x, ylab = "", xlab = "(d)", pch=19, col=COL[1,2], axes = FALSE)
box()

dev.off()

cor(yNonLin,x)
cor(yPosLinStrong,x)
cor(yPosLinWeak,x)
cor(yNegLinWeak,x)