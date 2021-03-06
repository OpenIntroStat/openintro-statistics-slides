library(openintro)
data(COL)

d = read.csv("house_income.csv")

house_income = d$house_income[!is.na(d$house_income) & d$house_income < 4000000]


myPDF('house_income_dot_stacked.pdf', 7, 3, mar=c(4,2,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)



radius  <- 20000
cex     <- 1.4
seed    <- 2
stacks  <- dotPlotStack(house_income, radius=radius, addDots=FALSE, pch=19, col=COL[1], cex=1.25, seed=seed)
plot(0, type="n", xlab="Annual Household Income", axes=FALSE, ylab="", xlim=range(house_income), ylim=c(0, quantile(stacks[[3]], 0.999)))

dotPlotStack(house_income, radius=radius, pch=19, col=COL[1], cex=cex, seed=seed)
abline(h=0)
axis(1)

dev.off()

# robust stats

median(house_income)
IQR(house_income)
mean(house_income)
sd(house_income)

l10 = house_income
l10[which.max(house_income)] = 10000000
median(l10)
IQR(l10)
mean(l10)
sd(l10)

s10 = house_income
s10[which.min(house_income)] = 10000000
median(s10)
IQR(s10)
mean(s10)
sd(s10)
