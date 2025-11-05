set.seed(213)

# Generate with rnorm; truncate to [0, 4]
GPA_raw <- rnorm(10, mean=3, sd=0.2)
GPA <- pmin(pmax(GPA_raw, 0), 4)  # Force values into [0, 4]
GPA <- as.data.frame(GPA)

write.csv(GPA, file="GPA_t.csv", row.names = FALSE)

## Paired data generation 
set.seed(213)

# Generate with rnorm; truncate to [0, 100]
midterm_raw <- round(rnorm(100, 80, 10), 2)
final_raw   <- round(rnorm(100, 70, 10), 2)

midterm <- pmin(pmax(midterm_raw, 0), 100)
final   <- pmin(pmax(final_raw,   0), 100)

Score_data <- data.frame(midterm_exam = midterm, final_exam = final)
write.csv(Score_data, file="Exam_data.csv", row.names = FALSE)


