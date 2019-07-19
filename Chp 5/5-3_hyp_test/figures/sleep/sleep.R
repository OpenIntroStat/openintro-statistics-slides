library(openintro)
data(COL)

pdf("sleep_pval_ts.pdf", height = 3.5, width = 7)
par(mar=c(2,0,0,0))
mu = 7
se = 0.94/sqrt(169)
normTail(m = mu, s = se, U = 7.12, L = 6.88, axes = FALSE, col = COL[1])
axis(1, at = c(mu-3*se, 6.88, 7, 7.12, mu+3*se), 
     labels = c(NA, expression(paste(bar(x), "= 6.88")),
                expression(paste(mu, "= 7")), 
                7.12 , NA), cex.axis = 1.5)
dev.off()

