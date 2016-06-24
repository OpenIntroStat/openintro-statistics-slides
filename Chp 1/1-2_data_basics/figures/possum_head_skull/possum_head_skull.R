library(openintro)
data(possum)
data(COL)

myPDF("possum_head_skull.pdf", 7, 4, mar=c(4,4,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

plot(possum$headL, possum$skullW, pch=20, col= COL[1], xlab = "head length (mm)", ylab = "skull width (mm)")

dev.off()