library(openintro)
data(COL)

pdf("bf.pdf", height = 3.5, width = 7)
par(mar=c(2,0,0,0))
mu = 0
sd = 1
normTail(m = mu, s = sd, L = -3, U = 3, axes = FALSE, col = COL[1])
axis(1, at = c(mu-3*sd, 0, mu+3*sd), 
     labels = c(expression(paste(bar(x)[m], "-", bar(x)[w], "= 11.1")),
                expression(paste(mu[m], "-", mu[w], "= 0")), 
                11.1), cex.axis = 1.5)
dev.off()


