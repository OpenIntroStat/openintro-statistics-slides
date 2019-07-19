setwd("~/Desktop/Teaching/Sta 101 - F12/Lecture slides/Unit 3/Lecture 2/figures/cltSimRS")

library(openintro)

set.seed(85479)
a  = rgamma(2000,2,2)*10
mean_a = mean(a)
sd_a = sd(a)

pdf("cltSimRS_pop.pdf", height = 3.5, width = 5)
par(mar=c(4,0,0,0), mgp=c(2.7,0.7,0), las = 1)
hist(a, col = COL[1], xlab = "", breaks = 20, main = "", axes = FALSE)
axis(1, cex.axis = 1.5)
text(x = 30, y = 250, "Population", cex = 1.5)
text(x = 30, y = 220, substitute(paste(mu, " = ", x), list(x = round(mean_a))), cex = 1.5)
text(x = 30, y = 190, substitute(paste(sigma, " = ", x), list(x = round(sd_a))), cex = 1.5)
dev.off()

###

set.seed(9582)
samp = sample(a, size = 100)

pdf("cltSimRS_samp.pdf", height = 3, width = 5)
par(mar=c(4,3,0.5,1), mgp=c(2.7,0.7,0), las = 1)
hist(samp, col = COL[1], xlab = "Plot B", ylab = "", main = "", cex.axis = 1.5, cex.lab = 2)
dev.off()

###

set.seed(345)

sampling_7 = rep(0, 100)
n = 7

for(i in 1:100){
  	temp <- sample(a, n)
   	sampling_7[i] <- mean(temp)
   	}

pdf("cltSimRS_n7.pdf", height = 3, width = 5)
par(mar=c(4,3,0.5,1), mgp=c(2.7,0.7,0), las = 1)
hist(sampling_7, col = COL[1], xlab = "Plot A", ylab = "", main = "", cex.axis = 1.5, cex.lab = 2)
dev.off()

###

set.seed(6543)

sampling_49 = rep(0, 100)
n = 49

for(i in 1:100){
  	temp <- sample(a, n)
   	sampling_49[i] <- mean(temp)
   	}

pdf("cltSimRS_n49.pdf", height = 3, width = 5)
par(mar=c(4,3,0.5,1), mgp=c(2.7,0.7,0), las = 1)
hist(sampling_49, col = COL[1], xlab = "Plot C", ylab = "", main = "", cex.axis = 1.5, cex.lab = 2)
dev.off()
