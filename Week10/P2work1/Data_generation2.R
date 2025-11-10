# Each year the US Environmental Protection Agency (EPA) releases fuel economy data on cars manufactured in that year. Below are summary statistics on fuel efficiency (in miles/gallon) from random samples of cars with manual and automatic transmissions manufactured in 2012. Do these data provide strong evidence of a difference between the average fuel efficiency of cars with manual and automatic transmissions in terms of their average city mileage? Assume that conditions for inference are satisfied.


# Create an R data frame with the EPA fuel efficiency data for cars manufactured in 2012
# Sample data based on a hypothetical summary — you may adjust the values below as needed

# Example summary statistics:
# Manual transmission: mean = 19.85 mpg, sd = 4.51, n = 26
# Automatic transmission: mean = 16.12 mpg, sd = 3.58, n = 26

# To simulate data based on these summaries:

set.seed(123)  # For reproducibility

n_manual <- 10
mean_manual <- 19.85
sd_manual <- 4.51

n_auto <- 10
mean_auto <- 16.12
sd_auto <- 3.58

# Simulate random samples for manual and automatic transmissions
manual_mileage <- rnorm(n_manual, mean_manual, sd_manual)
automatic_mileage <- rnorm(n_auto, mean_auto, sd_auto)

# Create a data frame
fuel_data <- data.frame(
  mileage = c(manual_mileage, automatic_mileage),
  transmission = factor(rep(c("Manual", "Automatic"), times = c(n_manual, n_auto)))
)

# View the first few rows
head(fuel_data)


write.csv(fuel_data, file="mileage.csv")




# Undergraduate students taking an introductory statistics course at Boston University conducted a survey about GPA and major.
# We want to test if the mean GPA differs by major (4 groups).

set.seed(123)  # For reproducibility

# Sample sizes for each major
n_bio <- 12
n_stat <- 12
n_eng <- 12
n_hist <- 12

# Means and standard deviations (hypothetical)
mean_bio <- 3.2
sd_bio <- 0.4

mean_stat <- 3.6
sd_stat <- 0.3

mean_eng <- 3.4
sd_eng <- 0.35

mean_hist <- 3.1
sd_hist <- 0.5

# Simulate GPA data for each major
bio_gpa <- rnorm(n_bio, mean_bio, sd_bio)
stat_gpa <- rnorm(n_stat, mean_stat, sd_stat)
eng_gpa <- rnorm(n_eng, mean_eng, sd_eng)
hist_gpa <- rnorm(n_hist, mean_hist, sd_hist)

# Create a data frame combining all majors
gpa_data <- data.frame(
  gpa = c(bio_gpa, stat_gpa, eng_gpa, hist_gpa),
  major = factor(rep(c("Biology", "Statistics", "Engineering", "History"),
                     times = c(n_bio, n_stat, n_eng, n_hist)))
)

# View the first few rows of the data
head(gpa_data)

# Save dataset to CSV
write.csv(gpa_data, file = "gpa_major.csv", row.names = FALSE)