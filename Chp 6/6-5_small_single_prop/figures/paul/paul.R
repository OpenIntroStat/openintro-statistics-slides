source("http://www.openintro.org/stat/slides/inference.R")

paul = factor(c(rep("yes", 8), rep("no", 0)), levels = c("yes","no"))

pdf('paul_HT.pdf', 7, 3)

inference(paul, est = "proportion", type = "ht", 
          method = "simulation", success = "yes", 
          null = 0.5, alternative = "greater", seed = 290)

dev.off()
