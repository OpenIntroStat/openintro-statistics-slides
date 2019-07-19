source("http://www.openintro.org/stat/slides/inference.R")

back = as.factor(c(rep("correct", 11), rep("wrong", 1))) 

pdf('back_HT.pdf', 7, 3)

inference(back, est = "proportion", type = "ht", method = "simulation",
          success = "correct", null = 0.1, alternative = "greater", seed = 654, nsim = 100)

dev.off()
