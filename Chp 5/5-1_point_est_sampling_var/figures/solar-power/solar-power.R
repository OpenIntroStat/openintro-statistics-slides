library(openintro)
library(here)
set.seed(1274)

# set pop

pop_size <- 250000000
possible_entries <- c(rep("support", 0.88 * pop_size), 
                      rep("not", 0.12 * pop_size))

# sample

phat <- rep(NA, 10000)
for(i in 1:10000){
  sampled_entries <- sample(possible_entries, size = 1000)
  phat[i] <- sum(sampled_entries == "support") / 1000
}

# df

sampling <- tibble(phat = phat)

# plot

ggplot(sampling, aes(x = phat)) +
  geom_histogram(binwidth = 0.01, fill = COL[1]) +
  theme_minimal() +
  labs(x = "Simulated sample proportion", y = "")

ggsave(filename = here::here("Chp 5/5-1_point_est_sampling_var/figures/solar-power/", "solar-power-sampling.pdf"), width = 5, height = 3)


