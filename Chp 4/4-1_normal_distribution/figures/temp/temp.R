library(openintro)
data(COL)

pdf("tempLOW3PERC.pdf", height = 2, width = 3)
par(mar=c(2.1,0,0,0))
normTail(m = 98.2, s = 0.73, L = 96.8, axes = FALSE, col = COL[1])
axis(1, at=c(96.01, 96.8, 98.2, 100.39), label=expression("", "?", "98.2", ""))
text(x = 96.4, y = 0.11, "0.03", col = COL[1], cex = 1.25)
dev.off()


pdf("tempHIGH10PERC.pdf", height = 2, width = 3)
par(mar=c(2.1,0,0,0))
normTail(m = 98.2, s = 0.73, U = 99.1, axes = FALSE, col = COL[1])
axis(1, at=c(96.01, 98.2, 99.1, 100.39), label=expression("", "98.2", "?", ""))
text(x = 99.7, y = 0.22, "0.10", col = COL[1], cex = 1.25)
text(x = 98.2, y = 0.25, "0.90", col = COL[1], cex = 1.25)
dev.off()