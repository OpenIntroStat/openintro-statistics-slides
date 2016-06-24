library(openintro)
data(COL)

d = read.csv("gpa_study_hours.csv")

myPDF('gpa_study_hours.pdf', 7, 4, mar=c(4,4,0.5,0.5))

plot(d$gpa ~ d$study_hours, pch = 19, col = COL[1,3], xlab = "Hours of study / week", ylab = "GPA", cex.lab = 1.5, cex.axis = 1.5)

dev.off()