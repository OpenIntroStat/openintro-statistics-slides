source("http://www.openintro.org/stat/slides/inference.R")

hand = as.factor(c(rep("correct", 7), rep("wrong", 5), c(rep("correct", 11), rep("wrong", 1))))
gr = c(rep("palm",12),rep("back",12))



pdf('palm_back_HT.pdf', 7, 3)

inference(hand, gr, est = "proportion", type = "ht", null = 0, alternative = "twosided",
          order = c("back","palm"), success = "correct", method = "simulation", seed = 879,
          nsim = 100)

dev.off()
