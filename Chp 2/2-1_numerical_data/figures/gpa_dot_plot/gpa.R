library(openintro)
data(COL)

d = read.csv("gpa.csv")

gpa = d$gpa[d$gpa <= 4]
gpa = gpa[!is.na(gpa)]

# dotplot

myPDF('gpa_dot_plot.pdf', 7, 1.5, mar=c(4,0.5,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

openintro::dotPlot(gpa, pch = 19, col = COL[1,4], xlab = "GPA", xlim = c(2.5,4), ylab = "")

dev.off()

# with mean

myPDF('gpa_dot_plot_mean.pdf', 7, 1.5, mar=c(4,0.5,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

openintro::dotPlot(gpa, pch = 19, col = COL[1,4], xlab = "GPA", xlim = c(2.5,4), ylab = "")
M <- mean(d$gpa[d$gpa <= 4], na.rm = TRUE)
polygon(M + c(-2,2,0)*0.01, c(0.25, 0.25, 0.5), border=COL[4], col=COL[4])

dev.off()

# stacked


X <- c()
Y <- c()
for(i in 1:length(gpa)){
	x   <- gpa[i]
	rec <- sum(gpa == x)
	X   <- append(X, rep(x, rec))
	Y   <- append(Y, 1:rec)
}


myPDF('gpa_dot_plot_stacked.pdf', 7, 3, mar=c(4,2,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

radius  <- 0.0249
cex     <- 1.3
seed    <- 1
stacks  <- dotPlotStack(gpa, radius=radius, addDots=FALSE, pch=19, col=COL[1], cex=1.25, seed=seed)
plot(0, type="n", xlab="GPA", axes=FALSE, ylab="", xlim=c(2.6, 4.0), ylim=c(0, quantile(stacks[[3]], 0.994)))

dotPlotStack(gpa, radius=radius, pch=19, col=COL[1], cex=cex, seed=seed)
abline(h=0)
axis(1)

# plot(X,Y, xlim = c(2.5,4), pch = 19, col = COL[1,4], xlab = "GPA", ylab = "", axes = FALSE)
# axis(1)
# axis(2)

dev.off()
