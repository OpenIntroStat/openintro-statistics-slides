library(openintro)
data(COL)

win = c(rep(1, 12), rep(5, 4), rep(10, 1), rep(0, 35))
win = factor(win, levels = c(0:10))

myPDF('card_game.pdf', 7, 3, mar=c(3,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

barplot(table(win)/52, col = COL[1], las = 1)

dev.off()