pdf('chiSquareAreaAbove5Point1WithDF5.pdf', 5, 3)
par(mar=c(2, 1, 1, 1), mgp=c(2.1, 0.8, 0), las=1)
x <- seq(0, 25, 0.05)
y <- dchisq(x, 5)
plot(x, y, type='l', axes=FALSE)
abline(h=0)
axis(1)

these <- which(x > 5.1)
X <- x[c(these[1], these, rev(these)[1])]
Y <- c(0, y[these], 0)
polygon(X, Y, col='#2277AA33', border='#00000044')

dev.off()