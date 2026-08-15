############################################################
# MA 213 - Lab 2 Starter Code
# Data Detective Agency: Baby Names and Cars
#
# This file is intentionally a starter, not a solution key. Some lines
# are commented out because you need to fill in the missing pieces first.
############################################################

library(dplyr)

############################################################
# Getting Started. Open the Case Files
############################################################

baby_names <- read.csv("baby_names.csv")
cars <- read.csv("mtcars.csv")

head(baby_names)
head(cars)

str(baby_names)
str(cars)

# Discuss:
# - What is one row in baby_names?
# - What is one row in cars?
# - Which variables are categorical? Which are numerical?


############################################################
# Question 1. Classify the Variables
############################################################

# Use the activity handout to classify variables from both data sets.
# No code is required here, but head() and str() above should help.


############################################################
# Question 2. Investigate a Baby Name Year
############################################################

# Choose a year your group wants to investigate.
my_year <- 1999

# Fill in the variable name inside filter(), then uncomment.
# baby_year <- baby_names %>%
#   filter(________ == my_year)
#
# head(baby_year)


# Find the top 5 male and top 5 female names in your chosen year.

# top5_male <- baby_year %>%
#   filter(________ <= 5) %>%
#   select(rank, ________)
#
# top5_female <- baby_year %>%
#   filter(________ <= 5) %>%
#   select(rank, ________)
#
# top5_male
# top5_female

# Interpretation:
# In your chosen year, what were the top names?
# Which variables in this question are categorical? Which are numerical?


############################################################
# Question 3. Track One Name Over Time
############################################################

# Pick one name from your top 5 list.
chosen_name <- "Emma"

# name_history <- baby_names %>%
#   filter(female == __________ | male == __________) %>%
#   select(year, rank, male, female)
#
# head(name_history)
# tail(name_history)

# Optional hint: summarize the best rank this name ever had.
# best_rank <- name_history %>%
#   summarize(best_rank = min(________))
#
# best_rank

# Interpretation:
# Was the name climbing, falling, or coming back over time?


############################################################
# Question 4. Build a Contingency Table
############################################################

# First, make the transmission code readable.
# Hint: am = 0 means automatic; am = 1 means manual.

# cars2 <- cars %>%
#   mutate(transmission = ifelse(____ == 0, "automatic", "manual"))
#
# head(cars2)


# Build a contingency table for transmission type and cylinder group.
# You can use table() OR count().

# Option 1: table()
# transmission_cyl_table <- table(cars2$________, cars2$________)
# transmission_cyl_table


# Option 2: dplyr count()
# transmission_cyl_counts <- cars2 %>%
#   count(________, ________)
#
# transmission_cyl_counts

# Interpretation:
# Which transmission/cylinder combinations are most common?
# Which combinations are rare or missing?


############################################################
# Question 5. Compare Cylinder Groups and Close the Case
############################################################

# cylinder_summary <- cars2 %>%
#   group_by(________) %>%
#   summarize(
#     avg_mpg = mean(________),
#     avg_hp = mean(________),
#     number_of_cars = n()
#   )
#
# cylinder_summary

# Interpretation:
# What happens to average mpg and average hp as cylinder count changes?


############################################################
# Optional Challenge: Create a Power Category
############################################################

# cars_power <- cars2 %>%
#   mutate(power_group = ifelse(hp > median(hp), "high horsepower", "lower horsepower"))
#
# power_summary <- cars_power %>%
#   group_by(power_group) %>%
#   summarize(avg_mpg = mean(________), number_of_cars = n())
#
# power_summary


############################################################
# Closing Arguments
############################################################

# Final reflection:
# 1. What was one categorical question you answered?
# 2. What was one numerical question you answered?
# 3. What did your contingency table help you see?
# 4. Where did filter() help?
# 5. Where did mutate() help?
# 6. Where did summarize() help?
