library(openintro)
library(xtable)

aldrin = read.csv("aldrin.csv", header = T)

# dotplot

pdf("dotplot.pdf", height = 2.5, width = 5.5)

par(mar=c(2,4.1,0,0), las=1, mgp=c(3,0.7,0), mfrow = c(3,1), cex.lab = 1.25, cex.axis = 1.25)

dotPlot(aldrin$aldrin[aldrin$depth == "bottom"], xlim = c(3,9), axes = FALSE, col = COL[1,2], xlab = "", ylab = "bottom")
dotPlot(aldrin$aldrin[aldrin$depth == "middepth"], xlim = c(3,9), axes = FALSE, col = COL[1,2], xlab = "", ylab = "middepth")
dotPlot(aldrin$aldrin[aldrin$depth == "surface"], xlim = c(3,9), col = COL[1,2], ylab = "surface")

dev.off()

# summary table

round(mean(aldrin$aldrin[aldrin$depth == "bottom"]),2)
round(sd(aldrin$aldrin[aldrin$depth == "bottom"]),2)

round(mean(aldrin$aldrin[aldrin$depth == "middepth"]),2)
round(sd(aldrin$aldrin[aldrin$depth == "middepth"]),2)

round(mean(aldrin$aldrin[aldrin$depth == "surface"]),2)
round(sd(aldrin$aldrin[aldrin$depth == "surface"]),2)

# anova table

m = lm(aldrin ~ depth, data = aldrin)

xtable(anova(m))

# f plot

pdf("f.pdf", height = 2, width = 5.5)

par(mar = c(0,0,0,0))

fTail(dfG = 2, dfE = 27, U = 6.14)

dev.off()


## diagnostics

# nearly normal

pdf("normal.pdf", height = 5, width = 10)

par(mar=c(2,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(1,3))

hist(aldrin$aldrin[aldrin$depth == "bottom"], col = COL[1], main = "", ylab = "", axes = FALSE)
axis(1, at = c(3,5,7,9))
axis(2, at = c(0,1,2,3))
hist(aldrin$aldrin[aldrin$depth == "middepth"], col = COL[1], main = "", ylab = "", axes = FALSE)
axis(1, at = c(3,5,7))
axis(2, at = c(0,1,2))
hist(aldrin$aldrin[aldrin$depth == "surface"], col = COL[1], main = "", ylab = "", axes = FALSE, xlim = c(2.5,5.5))
axis(1, at = c(2.5,4,5.5))
axis(2, at = c(0,1,2,3,4))

dev.off()


# constant variability in residuals

pdf("homo.pdf", height = 4.3, width = 7)

par(mar=c(3,3,2,1), las=1, mgp=c(3,1.9,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(1,1))

boxplot(aldrin$aldrin ~ aldrin$depth, names = c("bottom\nsd=1.58","middepth\nsd=1.10","surface\nsd=0.66"))

dev.off()



# t.test

t.test(aldrin$aldrin[aldrin$depth == "bottom"], aldrin$aldrin[aldrin$depth == "surface"])
t.test(aldrin$aldrin[aldrin$depth == "bottom"], aldrin$aldrin[aldrin$depth == "middepth"])
t.test(aldrin$aldrin[aldrin$depth == "middepth"], aldrin$aldrin[aldrin$depth == "surface"])