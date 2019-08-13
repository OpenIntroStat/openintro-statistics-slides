# load packages ----------------------------------------------------------------
library(tidyverse)
library(openintro)
library(here)

# low p ------------------------------------------------------------------------

p <- 0.05

N <- 100000000
ones <- N * p
zeros <- N * (1-p)
pop <- c(rep(1, ones), rep(0, zeros))

n <- 50

set.seed(12345)

sampling <- tibble(
  phat = rep(NA, 1000)
)

for(i in 1:nrow(sampling)){
  sampling$phat[i] <- sum(sample(pop, n)) / n
}

ggplot(sampling, aes(x = phat)) +
  geom_histogram(binwidth = 0.01, fill = COL[1]) +
  theme_minimal() +
  labs(x = "Simulated sample proportion", y = "")

ggsave(filename = here("Chp 5/5-1_point_est_sampling_var/figures/sf/", "low-p.pdf"), width = 5, height = 3)
