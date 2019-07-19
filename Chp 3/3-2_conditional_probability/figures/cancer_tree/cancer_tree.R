library(openintro)


myPDF('cancer_tree_first.pdf', 7, 3.75, mar=c(0,0,0,0))

treeDiag(c('Cancer status', 'Test result'), out1 = c("cancer","no cancer"), out2 = c("positive","negative"), c(0.017, 0.983), list(c(0.78, 0.22), c(0.1, 0.9)), showWork = TRUE, solwd=0.23)

dev.off()



myPDF('cancer_tree_second.pdf', 7, 3.75, mar=c(0,0,0,0))

treeDiag(c('Cancer status', 'Test result'), out1 = c("cancer","no cancer"), out2 = c("positive","negative"), c(0.12, 0.88), list(c(0.78, 0.22), c(0.1, 0.9)), showWork = TRUE, solwd=0.23)

dev.off()