library(openintro)
data(COL)

pdf("ketchupLT358.pdf", height = 2, width = 3)
par(mar=c(2.1,0,0,0))
normTail(m = 36, s = 0.11, L = 35.8, axes = FALSE, col = COL[1])
axis(1, at=c(35.67, 35.8, 36, 36.33), label=expression("", "35.8", "36", ""))
dev.off()


pdf("ketchupBET.pdf", height = 2, width = 3)
par(mar=c(2.1,0,0,0))
normTail(m = 36, s = 0.11, M = c(35.8, 36.2), axes = FALSE, col = COL[1])
axis(1, at=c(35.67, 35.8, 36, 36.2, 36.33), label=expression("", "35.8", "36", "36.2", ""))
dev.off()

pdf("ketchupLT362.pdf", height = 2, width = 3)
par(mar=c(2.1,0,0,0))
normTail(m = 36, s = 0.11, L = 36.2, axes = FALSE, col = COL[1])
axis(1, at=c(35.67, 36, 36.2, 36.33), label=expression("", "36", "36.2", ""))
dev.off()