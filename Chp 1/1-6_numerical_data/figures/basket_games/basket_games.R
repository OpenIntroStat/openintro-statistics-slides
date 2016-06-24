library(openintro)
data(COL)

d = read.csv("basket_games.csv")

basket_games = d$basket_games[!is.na(d$basket_games)]

# hist

myPDF('basket_games_hist.pdf', 7, 4, mar=c(4,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

histPlot(basket_games, col = COL[1], xlab = "# of basketball games attended", ylab = "")

dev.off()

# hist log

myPDF('basket_games_hist_log.pdf', 7, 4, mar=c(4,3,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

histPlot(log(basket_games), col = COL[1], xlab = "# of basketball games attended", ylab = "")

dev.off()

# tails

tail(sort(basket_games))

round(tail(sort(log(basket_games))),2)