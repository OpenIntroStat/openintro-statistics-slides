library(openintro)
data(COL)

d = read.csv("year_clubs.csv")
d$year = factor(d$year, levels = c("First-year","Sophomore","Junior","Senior","Grad student"))
d = d[d$year != "Grad student",]
d$year = droplevels(d$year)

# box

myPDF('year_clubs.pdf', 9, 4, mar=c(3,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

boxPlot(d$clubs, fact = d$year, col = COL[1], ylab = "")

dev.off()