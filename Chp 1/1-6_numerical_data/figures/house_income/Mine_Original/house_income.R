library(openintro)
data(COL)

d = read.csv("house_income.csv")

house_income = d$house_income[!is.na(d$house_income) & d$house_income < 4000000]

length(house_income)

# stacked dot

temp = house_income
X <- c()
Y <- c()
for(i in 1:length(temp)){
	x   <- temp[i]
	rec <- sum(temp == x)
	X   <- append(X, rep(x, rec))
	Y   <- append(Y, 1:rec)
}


myPDF('house_income_dot_stacked.pdf', 7, 3, mar=c(4,2,0.5,0.5), cex.lab = 1.5, cex.axis = 1.25)

plot(X,Y, xlim = range(temp), pch = 19, col = COL[1,3], xlab = "Annual household income", ylab = "", axes = FALSE)
axis(1)
axis(2)

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
