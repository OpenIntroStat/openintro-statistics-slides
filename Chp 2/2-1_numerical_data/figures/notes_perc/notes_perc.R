library(openintro)
data(COL)

d = read.csv("notes_perc.csv")

notes_perc = d$notes_perc[!is.na(d$notes_perc)]

# hist

myPDF('notes_perc_hist.pdf', 7, 4, mar=c(4,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

histPlot(notes_perc, col = COL[1], xlab = "% of time in class spent taking notes", ylab = "")

dev.off()



mean(notes_perc)
median(notes_perc)