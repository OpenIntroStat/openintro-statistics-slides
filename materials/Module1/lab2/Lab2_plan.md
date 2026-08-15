### Lab 2: Data transformation and interpretation

**Lecture anchor:** Lecture 3

## Lesson Plan (50 minutes)

- 5 min Getting started: `library(dplyr)`, read both CSVs, `head()` and `str()`
  - triage anyone whose `library(dplyr)` fails before they fall behind
- 5 min Icebreaker: partner intros, then guess a popular name from your birth year
- 8 min Question 1: classify variables and name the observational unit for each data set
- 12 min Questions 2-3 (baby names): filter to one year, pull the top 5, track one name over time
- 12 min Question 4 (cars): `mutate()` the transmission label, then build the contingency table
- 8 min Question 5 and closing: `group_by()` + `summarize()` by cylinder, write the closing argument

The worksheet is pair work throughout. Collect it at the door.

## Before lab

- Print `Lab2_worksheet.pdf`, one per student
- Post `baby_names.csv`, `mtcars.csv`, and `Lab2.R` to Blackboard
- Check Tutorial 2 hash submissions and chase anyone missing; Tutorial 2 is the pre-lab for today
- Have `install.packages("dplyr")` ready to project

## Notes

- `dplyr` is the time sink this week, the way the R install was in Lab 1. Anyone who skipped Tutorial 2 will not have it. Send them `install.packages("dplyr")` immediately and keep moving; do not debug one machine while the room waits.
- `Lab2.R` is a starter, not a key. Most blocks are commented out with `________` blanks to fill in, so students cannot run it end to end until they complete each question.
- `read.csv("mtcars.csv")` turns the unnamed first column of car names into `X`, so `cars` has 12 columns, not 11. Same surprise as Lab 1's `sleep.csv`.
- Expected answers:
  - `baby_names` is 2820 x 4, covering 1880-2020; `cars` is 32 x 12.
  - Q2, top 5 in 1999 (the starter's `my_year`): male Jacob, Michael, Matthew, Joshua, Nicholas; female Emily, Hannah, Alexis, Sarah, Samantha.
  - Q3, "Emma" appears 45 times and peaks at rank 1 in 2008.
  - Q4, transmission x cylinder: automatic 3/4/12 and manual 8/3/2 across 4/6/8 cylinders.
  - Q5, average mpg falls 26.66 -> 19.74 -> 15.10 and average hp climbs 82.64 -> 122.29 -> 209.21 as cylinders go 4 -> 6 -> 8 (n = 11, 7, 14).
  - Optional challenge: high horsepower averages 15.41 mpg (n = 15), lower horsepower 24.22 mpg (n = 17).
- Watch for students reading the contingency table as "most common car" rather than a joint count. Push them to say which margin they are comparing.
- After lab: Tutorial 3 hash is due by 10pm Tuesday and is the pre-lab for Lab 3.

---
