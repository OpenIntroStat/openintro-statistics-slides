library(openintro)
data(COL)

library(Sleuth3)

donner = case2001

table(donner$Status, donner$Sex)

# status_age

pdf("status_age.pdf", height = 4, width = 8)

par(mar=c(2,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

boxplot(donner$Age ~ donner$Status)

dev.off()


# model
g=glm(Status~Age+Sex, data=donner, family=binomial)

pdf("donner_scatter.pdf", height = 4, width = 8)

par(mar=c(2,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(donner$Age,as.numeric(donner$Status)-1+0.01*((as.numeric(donner$Sex)-1)*2-1),xlab="Age",ylab="Status",xlim=c(0,80),pch=c(15,17)[donner$Sex], col = c(COL[1,2], COL[2,2]))

legend("topright",c("Male","Female"),pch=c(15,17), col = c(COL[1,2], COL[2,2]), inset = 0.025)

dev.off()

###

g1=glm(Status~Age, data=donner, family=binomial)

# missing plots

pdf("donner_scatter_pred.pdf", height = 4, width = 8)

par(mar=c(2,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(donner$Age,as.numeric(donner$Status)-1+0.01*((as.numeric(donner$Sex)-1)*2-1),xlab="Age",ylab="Status",xlim=c(0,80),pch=c(15,17)[donner$Sex], col = c(COL[1,2], COL[2,2]))

x=0:80
p = predict(g1,newdata=data.frame(Age=x))
lines(x,exp(p)/(1+exp(p)), col = COL[4], lwd = 2)

p1 = exp(p[1])/(1 + exp(p[1]))
p2 = exp(p[26])/(1 + exp(p[26]))
p3 = exp(p[51])/(1 + exp(p[51]))

points(x = c(0,25,50), y = c(p1,p2,p3), col = COL[4], pch = 19)

legend("topright",c("Male","Female"),pch=c(15,17), col = c(COL[1,2], COL[2,2]), inset = 0.025)

dev.off()

# model with prediction for each gender

pdf("donner_scatter_both.pdf", height = 4, width = 8)

par(mar=c(2,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(donner$Age,as.numeric(donner$Status)-1+0.01*((as.numeric(donner$Sex)-1)*2-1),xlab="Age",ylab="Status",xlim=c(0,80),pch=c(15,17)[donner$Sex], col = c(COL[1,2], COL[2,2]))

x=0:80
p_male = predict(g,newdata=data.frame(Age=x,Sex="Male"))
p_female = predict(g,newdata=data.frame(Age=x,Sex="Female"))

lines(x,exp(p_male)/(1+exp(p_male)), col = COL[1], lwd = 2)
lines(x,exp(p_female)/(1+exp(p_female)), col = COL[2], lwd = 2, lty = 2)

legend("topright",c("Male","Female"),pch=c(15,17), col = c(COL[1,2], COL[2,2]), inset = 0.025)

text(x = 45, y = 0.7, "Female", col = COL[2], cex = 1.5)
text(x = 20, y = 0.3, "Male", col = COL[1], cex = 1.5)

dev.off()









xtable(summary(g))
