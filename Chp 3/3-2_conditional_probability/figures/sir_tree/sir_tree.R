library(openintro)


myPDF('sir_tree.pdf', 7, 4, mar=c(0,0,0,0))

treeDiag(c('Group', 'Test result'), 
	out1 = c("susceptible","infected","recovered"), 
	out2 = c("positive","negative"), 
	c(0.6, 0.1, 0.3), 
	list(c(0.05, 0.95), c(0.99, 0.01), c(0.35,0.65)),
	textwd=0.20,solwd = 0.05)

dev.off()
