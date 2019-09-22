setwd("/Users/mine/Desktop/Teaching/Sta 101 - F11/Lectures/Lecture 19/7-4inference/figures/la")
library(xtable)

load("shpData10.RData")

# plot

pdf("la.pdf", height = 4.3, width = 5.5)

par(mar=c(4,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(shpData$Prop_EduHigherThan16th ~ shpData$Prop_RaceEthHispanic, xlab = "% Hispanic", ylab = "% College graduate", col = "#54278F99", pch = 19, axes = FALSE)
axis(1, at = seq(0,1,0.25), label = c("0%","25%","50%","75%","100%"))
axis(2, at = seq(0,1,0.25), label = c("0%","25%","50%","75%","100%"))
box()

dev.off()

# regression

la_model = lm(shpData$Prop_EduHigherThan16th ~ shpData$Prop_RaceEthHispanic)

summary(la_model)

xtable(summary(la_model))