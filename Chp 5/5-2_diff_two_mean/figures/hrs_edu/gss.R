setwd("~/Desktop/Teaching/Sta 104 - Su13/Slides/(4) Unit 4/Lec 2/figures")

library(foreign)
library(openintro)

gss = read.spss("~/Desktop/Teaching Examples/_data/gss2010.sav",to.data.frame = TRUE)

gss_sub = gss[which(!is.na(gss$hrs1) & !is.na(gss$degree)), ]
#gss_sub = gss_sub[, which(names(gss_sub) == "degree" | names(gss_sub) == "hrs1")]

write.csv(gss_sub, file = "gss.csv", row.names = FALSE)

##

gss = read.csv("http://stat.duke.edu/courses/Summer13/sta104.01-1/resources/data/gss.csv")

gss$edu = NA
gss$edu[gss$degree == "LT HIGH SCHOOL" | gss$degree == "HIGH SCHOOL"] = "hs or lower" 
gss$edu[gss$degree == "JUNIOR COLLEGE" | gss$degree == "BACHELOR" | gss$degree == "GRADUATE"] = "coll or higher" 
gss$edu = as.factor(gss$edu)

pdf("hrs_edu_hist.pdf", height = 3.5, width = 5)
par(mar=c(4,4,1,.5), mgp=c(2.3,0.7,0), mfrow=c(2,1))
hist(gss$hrs1[gss$edu == "coll or higher"], xlim = c(0,90), xlab = "", main = "coll or higher",col=COL[1])
hist(gss$hrs1[gss$edu == "hs or lower"], xlim = c(0,90), xlab = "hours worked per week", main = "hs or lower",col=COL[1])
dev.off()

round(mean(gss$hrs1[gss$edu == "coll or higher"]),1)
round(mean(gss$hrs1[gss$edu == "hs or lower"]),1)

round(sd(gss$hrs1[gss$edu == "coll or higher"]),2)
round(sd(gss$hrs1[gss$edu == "hs or lower"]),2)

length(gss$hrs1[gss$edu == "coll or higher"])
length(gss$hrs1[gss$edu == "hs or lower"])

source("~/Desktop/Teaching/Sta 104 - Su13/Lab/inference/inference.R")
inference(gss$hrs1 , gss$edu, type = "ht", method = "theo", alternative = "twosided", est = "mean", null = 0)

mu = 0
se = 0.89
l = -2.4
u = 2.4

pdf("hrs_norm.pdf", height = 3, width = 6)
par(mar=c(3.5,0,0,0), mgp=c(2.3,0.7,0), mfrow=c(1,1))
normTail(m = mu, s = se, L = l, U = u, xlab = "average differences", axes = FALSE, col = COL[1])
axis(1, at = c(mu-3*se, l, mu, u, mu+3*se), labels = c(NA, -2.4, 0, 2.4, NA), cex.axis = 1.2)
dev.off()