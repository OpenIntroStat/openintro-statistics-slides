library(openintro)
data(COL)

d = read.csv("extracurr_hrs.csv")

extracurr_hrs = d$extracurr_hrs[!is.na(d$extracurr_hrs)]

# hist

myPDF('extracurr_hrs_hist.pdf', 7, 4, mar=c(4,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

histPlot(extracurr_hrs, col = COL[1], xlab = "Hours / week spent on extracurricular activities", ylab = "")

dev.off()

# hist, different bin widths

myPDF('extracurr_hrs_hist2.pdf', 7, 4, mar=c(4,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

histPlot(extracurr_hrs, col = COL[1], xlab = "Hours / week spent on extracurricular activities", ylab = "", breaks = 2)

dev.off()


myPDF('extracurr_hrs_hist20.pdf', 7, 4, mar=c(4,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

histPlot(extracurr_hrs, col = COL[1], xlab = "Hours / week spent on extracurricular activities", ylab = "", breaks = 20)

dev.off()

myPDF('extracurr_hrs_hist30.pdf', 7, 4, mar=c(4,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

histPlot(extracurr_hrs, col = COL[1], xlab = "Hours / week spent on extracurricular activities", ylab = "", breaks = 30)

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

plot(X,Y, xlim = c(2.5,4), pch = 19, col = COL[1,4], xlab = "GPA", ylab = "", axes = FALSE)
axis(1)
axis(2)

dev.off()
