library(openintro)

d = read.csv("duke_games.csv", h = T)

data = d$games

pdf("duke_games_pop.pdf", width = 7, height = 4)
par(mar=c(4.5,2,0,0))
hist(data, xlab = "number of games attended", col=COL[1], main = "", cex.lab = 1.5, cex.axis = 1.25, ylab = "")
dev.off()


# sampling, n = 10
set.seed(1013)
n = 10
samp_mean = rep(NA,5000)

for(i in 1:5000){
	temp = sample(data, n)
	samp_mean[i] = mean(temp)
}

pdf("duke_games_n10.pdf", width = 7, height = 4)
par(mar=c(4,4,0,0))
hist(samp_mean, xlab = "sample means from samples of n = 10", col=COL[1], main = "", cex.lab = 1.5, cex.axis = 1.25, ylab = "")
dev.off()


# sampling, n = 30
set.seed(1014)
n = 30
samp_mean = rep(NA,5000)

for(i in 1:5000){
  temp = sample(data, n)
  samp_mean[i] = mean(temp)
}

pdf("duke_games_n30.pdf", width = 7, height = 4)
par(mar=c(4,4,0,0))
hist(samp_mean, xlab = "sample means from samples of n = 30", col=COL[1], main = "", cex.lab = 1.5, cex.axis = 1.25, ylab = "")
dev.off()



# sampling, n = 70
set.seed(1015)
n = 70
samp_mean = rep(NA,5000)

for(i in 1:5000){
  temp = sample(data, n)
  samp_mean[i] = mean(temp)
}

pdf("duke_games_n70.pdf", width = 7, height = 4)
par(mar=c(4,4,0,0))
hist(samp_mean, xlab = "sample means from samples of n = 70", col=COL[1], main = "", cex.lab = 1.5, cex.axis = 1.25, ylab = "")
dev.off()

