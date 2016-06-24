library(openintro)
data(COL)

pdf("app_z.pdf", height = 3.5, width = 7)
par(mar=c(2,0,0,0))
normTail(m = 8, s = 0.5, U = 9.7, axes = FALSE, col = "white")
axis(1, at = c(8-3*0.5, 8, 9.7, 8+3*0.5), 
     labels = c(NA, expression(paste(mu, " = 8")), 
                expression(paste(bar(x), " = 9.7")), NA), cex.axis = 1.5)
dev.off()


pdf("app_pval_gr.pdf", height = 3.5, width = 7)
par(mar=c(2,0,0,0))
normTail(m = 8, s = 0.5, U = 9.7, axes = FALSE, col = COL[1])
axis(1, at = c(8-3*0.5, 8, 9.7, 8+3*0.5), 
     labels = c(NA, expression(paste(mu, " = 8")), 
                expression(paste(bar(x), " = 9.7")), NA), cex.axis = 1.5)
dev.off()