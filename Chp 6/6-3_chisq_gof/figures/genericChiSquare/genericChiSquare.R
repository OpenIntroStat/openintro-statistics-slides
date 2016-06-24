setwd("/Users/mine/Desktop/Teaching/Sta 101 - F11/Lectures/Lecture 15/5-6gof/figures/genericChiSquare")

pdf('genericChiSquare.pdf', 5, 3)

chiTail(df = 6, U = 10, showdf = FALSE, axes = FALSE)
text(x = 12, y = 0.005, "p-value", col = "red", cex = 1)

dev.off()