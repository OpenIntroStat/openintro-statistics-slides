library(openintro)
data(COL)

d = read.csv("msw3-all")

colors = rev(as.vector(COL))

# pie

myPDF('mammal_pie_chart.pdf', 5, 5, mar=c(0,0,0,0))

pie(sort(table(d$Order)), labels="", col = c(colors,"white"))

dev.off()

myPDF('mammal_pie_chart_legend.pdf', 6.5, 6.5, mar=c(0,0,0,0))

plot.new()
legend("center", names(rev(sort(table(d$Order)))), fill = rev(c(colors,"white")))

dev.off()