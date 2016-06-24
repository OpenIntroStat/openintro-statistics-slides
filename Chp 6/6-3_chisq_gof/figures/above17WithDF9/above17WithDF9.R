chiTail <- function(df, U, showdf = TRUE, axes = TRUE){
	par(mar=c(2, 1, 1, 1), mgp=c(2.1, 0.8, 0), las=1)
	
	sd <- sqrt(2*df)
	xmax <- max(df + 4.000102*sd,U+2)
	x <- seq(0, xmax, 0.05)
	y <- dchisq(x, df)
	plot(x, y, type='l', axes=FALSE)

	if(axes == TRUE){
		abline(h=0)
		axis(1, at=c(0,U,xmax+3), label = c(0,U,NA), cex.axis = 2)		
	}
	if(axes == FALSE){
		lines(c(0,xmax), c(0,0))
	}
	
	if(showdf == TRUE){
		text(x = 0.8*xmax, y = 0.5*max(y), paste("df =",df), cex = 2)	
	}	
	
	these <- which(x > U)
	X <- x[c(these[1], these, rev(these)[1])]
	Y <- c(0, y[these], 0)
	polygon(X, Y, col='#569BBD')
}

pdf('above17WithDF9.pdf', 5, 3)

chiTail(df = 9, U = 17)

dev.off()