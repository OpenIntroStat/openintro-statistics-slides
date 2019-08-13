library(openintro)
library(datasets)
library(tidyverse)
library(scales)

age_survived <- apply(Titanic, c(3, 4), sum)

titanic_data <- tibble(
  Age = c(rep("Child", 52 + 57), rep("Adult", 1438 + 654)),
  Survival = c(rep("Died", 52), rep("Survived", 57), rep("Died", 1438), rep("Survived", 654))
  )

# table

table(titanic_data$Age, titanic_data$Survival) %>%
  addmargins()

# bar

ggplot(titanic_data, aes(x = Survival)) +
  geom_bar(fill = COL[1]) +
  labs(y = "Frequency") +
  theme_bw()

ggsave(filename = "titanic_bar.pdf", width = 5, height = 3, dpi = 72)

# rel freq bar

ggplot(titanic_data, aes(x = Survival)) +
  geom_bar(aes(y = (..count..)/sum(..count..)), fill = COL[1]) +
  labs(y = "Relative frequency") +
  scale_y_continuous(labels=percent) +
  theme_bw()

ggsave(filename = "titanic_rel_bar.pdf", width = 5, height = 3, dpi = 72)

# seg bar

ggplot(titanic_data, aes(x = Age, fill = Survival)) +
  geom_bar() +
  labs(y = "Frequency") +
  theme_bw() +
  scale_fill_manual(values = c(COL[1], COL[1,3]), breaks = c("Died", "Survived"))

ggsave(filename = "titanic_seg_bar.pdf", width = 5, height = 3, dpi = 72)

# seg bar dodged

ggplot(titanic_data, aes(x = Age, fill = Survival)) +
  geom_bar(position = "dodge") +
  labs(y = "Frequency") +
  theme_bw() +
  scale_fill_manual(values = c(COL[1], COL[1,3]), breaks = c("Died", "Survived"))

ggsave(filename = "titanic_seg_bar_dodge.pdf", width = 5, height = 3, dpi = 72)

# gender_rel_seg_bar

ggplot(titanic_data, aes(x = Age, fill = Survival)) +
  geom_bar(position = "fill") +
  labs(y = "Relative frequency") +
  theme_bw() +
  scale_fill_manual(values = c(COL[1], COL[1,3]), breaks = c("Died", "Survived"))

ggsave(filename = "titanic_rel_seg_bar.pdf", width = 5, height = 3, dpi = 72)

# mosaic

myPDF('titanic_mosaic.pdf', 5, 3, mar=c(1,0.5,0.5,0.5), cex.lab = 1.5, cex.axis = 1.5)

mosaicplot(table(titanic_data$Age, titanic_data$Survival), color = c(COL[1],COL[1,3]), ylab = "", main = "", cex.axis = 1.5)

dev.off()