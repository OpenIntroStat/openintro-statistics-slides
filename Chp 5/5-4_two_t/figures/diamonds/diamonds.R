# data from: http://lib.stat.cmu.edu/DASL/Datafiles/Fridaythe13th.html
library(openintro)
library(ggplot2)

setwd("/Users/mine/Desktop/Teaching/Sta 101 - S12/Lectures/Lecture 15/6-2smallTwoMeans/figures/diamonds")

# data

data(diamonds)

pt99 = diamonds[diamonds$carat == 0.99,]
pt99$ptprice = round(pt99$price / 99, 2)
pt99$carat = "pt99"
pt100_full = diamonds[diamonds$carat == 1, ]
set.seed(223)
rows_to_sample = sample(1: nrow(pt100_full), 30)
pt100 = pt100_full[rows_to_sample,]
pt100$ptprice = round(pt100$price / 100, 2)
pt100$carat = "pt100"

diamond = as.data.frame(rbind(pt99,pt100))

write.csv(diamond, file = "diamond.csv", row.names = FALSE)

# boxplot

myPDF("diamondBox.pdf", 1.1*5.5, 3.3, mar=c(2,3,0.5,1), mgp=c(2.4,0.7,0))
boxplot(diamond$ptprice ~ diamond$carat, names = c("carat = 0.99", "carat = 1"))
dev.off()

# t.test

# diamond = read.csv("http://stat.duke.edu/courses/Spring12/sta101.1/lec/diamond.csv", h = T)
inference(diamond$ptprice, diamond$carat, est = "mean", type = "ht", method = "theoretical", null = 0, alternative = "less", order = c("pt99", "pt100"))

# ci

inference(diamond$ptprice, diamond$carat, est = "mean", type = "ci", method = "theoretical", order = c("pt99", "pt100"))