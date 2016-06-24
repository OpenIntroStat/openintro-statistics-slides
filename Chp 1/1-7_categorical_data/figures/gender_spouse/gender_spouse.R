library(openintro)
data(COL)
library(xtable)

d = read.csv("gender_spouse.csv")

# freq tables

xtable(table(d$gender,d$spouse))

# bar

myPDF('gender_bar.pdf', 7, 4, mar=c(3,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

barplot(table(d$gender), col = COL[1], ylab = "")

dev.off()

# rel freq bar

myPDF('gender_rel_bar.pdf', 7, 4, mar=c(3,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

barplot(table(d$gender)/sum(table(d$gender)), col = COL[1], ylab = "")

dev.off()

# seg bar

myPDF('gender_seg_bar.pdf', 5, 5, mar=c(3,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.5)

barplot(table(d$spouse, d$gender), col = c(COL[1],COL[1,3]), ylab = "", legend = TRUE)

dev.off()

# gender_rel_seg_bar

myPDF('gender_rel_seg_bar.pdf', 5, 5, mar=c(3,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.5)

barplot(prop.table(table(d$spouse, d$gender), 2), col = c(COL[1],COL[1,3]), ylab = "")

dev.off()

# mosaic

myPDF('gender_mosaic.pdf', 5, 5, mar=c(1,0.5,0.5,0.5), cex.lab = 1.5, cex.axis = 1.5)

mosaicplot(table(d$gender, d$spouse), col = c(COL[1],COL[1,3]), ylab = "", main = "", cex.axis = 1.5)

dev.off()