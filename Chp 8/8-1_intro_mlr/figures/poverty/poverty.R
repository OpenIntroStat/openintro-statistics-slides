poverty = read.table("poverty.txt", h = T, sep = "\t")

library(openintro)
data(COL)

# rename columns

names(poverty) = c("state", "metro_res", "white", "hs_grad", "poverty", "female_house")

# reorder columns

poverty = poverty[,c(1,5,2,3,4,6)]

# pairs plot

panel.cor <- function(x, y, digits=2, prefix="", cex.cor, ...){
	usr <- par("usr"); on.exit(par(usr))
	par(usr = c(0, 1, 0, 1))
	r <- abs(cor(x, y))
	rreal = cor(x, y)
	txtreal <- format(c(rreal, 0.123456789), digits=digits)[1]
	txt <- format(c(r, 0.123456789), digits=digits)[1]
	if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
	text(0.5, 0.5, txtreal, cex = cex.cor * r)
}

pdf("poverty.pdf", 10, 8)

pairs(poverty[,c(2:6)], lower.panel = panel.cor, pch = 19, col = COL[1,2])

dev.off()

# poverty vs. female_house

pov_slr = lm(poverty ~ female_house, data = poverty)

xtable(summary(pov_slr), digits = 2)

pdf("poverty_female_house.pdf", height = 4.3, width = 5.5)
par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)
plot(poverty$poverty ~ poverty$female_house, ylab = "% in poverty", xlab = "% female householder", pch=19, col=COL[1,2])
abline(pov_slr, col = COL[4], lwd = 3)
dev.off()

cor(poverty$poverty, poverty$female_house)

# anova

pov_slr = lm(poverty ~ female_house, data = poverty)
anova(pov_slr)
xtable(anova(pov_slr), digits = 2)


# poverty vs. female_house and hs_grad

pov_mlr = lm(poverty ~ female_house + white, data = poverty)

xtable(summary(pov_mlr), digits = 2)

xtable(anova(pov_mlr), difits = 2)





# hs_grad vs. white

m6 = lm(hs_grad ~ white, data = poverty)
summary(m6)

# junk model: hs_grad vs. white + metro_res

m7<- lm(hs_grad ~ white + metro_res, data = poverty)
summary(m7)