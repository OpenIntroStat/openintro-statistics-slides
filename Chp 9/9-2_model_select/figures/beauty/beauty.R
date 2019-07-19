library(openintro)
library(xtable)
data(COL)

d = read.csv(file = "beauty.csv")

###############################################################################
# Do more beautiful profs get higher evaluations?
###############################################################################

# lm: beauty

beauty_profeval = lm(profevaluation ~ beauty, data = d)
xtable(summary(beauty_profeval), digits = 2)

pdf("beauty_profeval.pdf", height = 4.3, width = 5.5)
par(mar=c(4,4,0.5,0.5))
plot(x = d$beauty, y = d$profevaluation, xlab="beauty", ylab="professor evaluation", pch = 19, col = COL[1,2], cex = 0.9, cex.lab = 1.25)
abline(beauty_profeval, col = COL[4], lwd = 2)
dev.off()

# lm: beauty + gender

d$pch = NA
d$col = NA
d$pch[d$gender == "male"] = 15
d$col[d$gender == "male"] = COL[1,2]
d$pch[d$gender == "female"] = 17
d$col[d$gender == "female"] = COL[2,2]


pdf("beauty_profeval_gender.pdf", height = 4.3, width = 5.5)
par(mar=c(4,4,0.5,0.5), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)
plot(d$profevaluation ~ d$beauty, pch = d$pch, col = d$col, xlab="beauty", ylab="professor evaluation")
legend("bottomright", c("male","female"), col = c(COL[1,2],COL[2,2]), pch = c(15,17), inset = 0.05)
dev.off()


beauty_profeval_gender = lm(profevaluation ~ beauty + gender, data = d)
xtable(summary(beauty_profeval_gender), digits = 2)

# full model

m = lm(profevaluation ~ beauty + gender + age + formal + lower + native + minority + students + tenure, data = d)

xtable(summary(m), digits = c(0,4,4,2,2))

# backwards elimination - R2 adjusted
# step 1
round(summary(lm(profevaluation ~ gender + age + formal + lower + native + minority + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + age + formal + lower + native + minority + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + formal + lower + native + minority + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + lower + native + minority + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + native + minority + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + lower + minority + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + lower + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + lower + native + minority + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + lower + native + minority + students, data = d))$adj.r.squared,4)

# step 2
round(summary(lm(profevaluation ~ gender + age + formal + lower + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + age + formal + lower + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + formal + lower + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + lower + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + lower + native + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + lower + native + students, data = d))$adj.r.squared,4)

# step 3
round(summary(lm(profevaluation ~ gender + age + formal + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + age + formal + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + formal + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + native + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + students + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + native + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + native + students, data = d))$adj.r.squared,4)

# step 4

round(summary(lm(profevaluation ~ gender + age + formal + native + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + age + formal + native + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + formal + native + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + native + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + tenure, data = d))$adj.r.squared,4)

round(summary(lm(profevaluation ~ beauty + gender + age + formal + native, data = d))$adj.r.squared,4)

# step

step(m)

# backwards - p-value

m1 = lm(profevaluation ~ beauty + gender + age + formal + lower + native + students + tenure, data = d)

m2 = lm(profevaluation ~ beauty + gender + age + formal + native + students + tenure, data = d)

m3 = lm(profevaluation ~ beauty + gender + age + formal + native + tenure, data = d)

m4 = lm(profevaluation ~ beauty + gender + age + native + tenure, data = d)

m5 = lm(profevaluation ~ beauty + gender + age + tenure, data = d)


# final model

m_final = lm(profevaluation ~ beauty + gender + age + formal + native + tenure, data = d)

xtable(summary(m_final), digits = c(0,4,4,2,2))