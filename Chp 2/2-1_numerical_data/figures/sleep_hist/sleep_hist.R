library(openintro)
data(COL)

d = read.csv("sleep.csv")

sleep = d$sleep[!is.na(d$sleep)]

# hist

myPDF('sleep_hist.pdf', 7, 4, mar=c(4,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

histPlot(sleep, col = COL[1], xlab = "Hours of sleep / night", ylab = "")

dev.off()



var(sleep)
sd(sleep)