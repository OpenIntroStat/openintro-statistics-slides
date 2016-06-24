COL <- c('#225588', '#558822CC', '#88225599', '#88552266')

pdf('chiSquareDistributionWithInceasingDF.pdf', 7.5, 3.75)
par(mar=c(2, 0.5, 0.25, 0.5), mgp=c(2.1, 0.8, 0), las=1)
x <- c(0, seq(0.0000001, 40, 0.05))
DF <- c(2.0000001, 4, 9)
y <- list()
for(i in 1:length(DF)){
	y[[i]] <- dchisq(x, DF[i])
}
plot(0, 0, type='n', xlim=c(0, 25), ylim=range(c(y, recursive=TRUE)), axes=FALSE)
for(i in 1:length(DF)){
	lines(x, y[[i]], lty=i, col=COL[i], lwd=3)
}
abline(h=0)
axis(1)

legend('topright', col=COL, lty=1:4, legend=paste(round(DF) ), title='Degrees of Freedom', cex=1, lwd = 3)
dev.off()
