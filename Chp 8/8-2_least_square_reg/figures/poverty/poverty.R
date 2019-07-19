poverty = read.table("poverty.txt", h = T, sep = "\t")

library(openintro)
data(COL)


# scatterplot, with many lines

pdf("poverty_hsgrad_manylines.pdf", 5.5, 5)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(poverty$Poverty ~ poverty$Graduates, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2])
abline(lm(poverty$Poverty ~ poverty$Graduates), col = COL[4], lwd = 3, lty = 1)

y1 = lm(poverty$Poverty ~ poverty$Graduates)$coefficients[1] + 2 + (1.1 * lm(poverty$Poverty ~ poverty$Graduates)$coefficients[2]) * poverty$Graduates
abline(lm(y1 ~ poverty$Graduates), lwd = 3, col = COL[2], lty = 2)

abline(h = 14, lwd = 3, col = COL[5], lty = 3)

y2 = 114 - (12/10) * seq(70,100,1)
abline(lm(y2 ~ seq(70,100,1)), lwd = 3, col = COL[3], lty = 4)

legend("topright", inset = 0.05, c("(a)","(b)","(c)", "(d)"), 
       col = c(COL[4],COL[2],COL[5],COL[3]), lwd = 3, lty = c(1,2,3,4))

dev.off()


# scatterplot, with line & residuals

pdf("poverty_hsgrad_res.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(poverty$Poverty ~ poverty$Graduates, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2])
lm_pov_grad = lm(poverty$Poverty ~ poverty$Graduates)
pred = predict(lm_pov_grad)
x = poverty$Graduates
for(i in 1:length(pred)){
  lines(c(x[i],x[i]), c(poverty$Poverty[i],pred[i]), col = COL[2])
}
abline(lm_pov_grad, col = COL[4], lwd = 3)

dev.off()


# scatterplot, with line & residuals

pdf("poverty_hsgrad_res_text.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(poverty$Poverty ~ poverty$Graduates, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2])
lm_pov_grad = lm(poverty$Poverty ~ poverty$Graduates)

pred = predict(lm_pov_grad)
x = poverty$Graduates

for(i in c(9,40)){
  lines(c(x[i],x[i]), c(poverty$Poverty[i],pred[i]), col = COL[2])
  text(x[i]+0.5, poverty$Poverty[i], "y", cex = 1.5, col = "blue")
  text(x[i]+1.2, mean(c(poverty$Poverty[i],pred[i])), as.character(round(poverty$Poverty[i] - pred[i],2)), cex = 1.5, col = "orange")
  text(x[i]-0.5, pred[i], expression(hat(y)), cex = 1.5, col = COL[4])
}
text(x[9], poverty$Poverty[9] + 0.5, "DC", col = COL[2])
text(x[40], poverty$Poverty[40] - 0.5, "RI", col = COL[2])

abline(lm_pov_grad, col = COL[4], lwd = 3)

dev.off()

# scatterplot

pdf("poverty_hsgrad.pdf", 5.5, 4.3)
par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)
plot(poverty$Poverty ~ poverty$Graduates, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2])
dev.off()


# scatterplot, wide with line 

pdf("poverty_hsgrad_line_wide.pdf", 10, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(poverty$Poverty ~ poverty$Graduates, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2], xlim = c(0,100), ylim = c(0,70))
lm_pov_grad = lm(poverty$Poverty ~ poverty$Graduates)
abline(lm_pov_grad, col = COL[4], lwd = 3)
abline(v = 0)
text(y = lm_pov_grad$coefficient[1]+3, x = 7, "intercept", cex = 1.5, col = COL[1])

dev.off()

# summary stats

round(mean(poverty$Graduates),2)
round(sd(poverty$Graduates),2)

round(mean(poverty$Poverty),2)
round(sd(poverty$Poverty),2)

round(cor(poverty$Graduates, poverty$Poverty), 2)

# scatterplot, with line

pdf("poverty_hsgrad_line.pdf", 5.5, 4.3)
par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)
plot(poverty$Poverty ~ poverty$Graduates, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2])
lm_pov_grad = lm(poverty$Poverty ~ poverty$Graduates)
abline(lm_pov_grad, col = COL[4], lwd = 3)
dev.off()

# scatterplot, with prediction

pdf("poverty_hsgrad_pred.pdf", 10, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5, cex.axis = 1.5)

plot(poverty$Poverty ~ poverty$Graduates, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2])
lm_pov_grad = lm(poverty$Poverty ~ poverty$Graduates)
abline(lm_pov_grad, col = COL[4], lwd = 3)
lines(x = c(82,82), y = c(0,64.781-0.6212*82), lty = 3)
lines(x = c(0,82), y = c(64.781-0.6212*82,64.781-0.6212*82), lty = 3)
dev.off()


# residuals plot

pdf("poverty_hsgrad_resplot.pdf", height = 6, width = 5.5)

par(mar=c(4,4,1,1), las=1, mgp=c(2.5,0.5,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(2,1))

lmPlot(x = poverty$Graduates, y = poverty$Poverty, highlight = c(9,40), hlCol = c(COL[4],COL[2]), hlPch = c(15,17), col = COL[1,2], ylab = "% in poverty", xlab = "% HS grad", lCol = COL[4], lwd = 2, xAxis = 4)

dev.off()


# residual calculation

poverty[9,]

poverty[40,]




# normality of residuals

pdf("normal_res.pdf", 10, 4.3)

par(mfrow=c(1,2))

histPlot(lm_pov_grad$residuals, col = COL[1], xlab = "residuals")

qqnorm(lm_pov_grad$residuals, pch = 19, col = COL[1,2])
qqline(lm_pov_grad$residuals, pch = 19, col = COL[1])

dev.off()

# constant variance

pdf("poverty_hsgrad_tube.pdf", height = 6, width = 5.5)

layout(matrix(1:2, 2), c(1,1), c(2,1))
par(mar=c(4,4,1,1))

plot(x = poverty$Graduates, y = poverty$Poverty, ylab = "% in poverty", xlab = "% HS grad", pch=19, col=COL[1,2])
makeTube(x = poverty$Graduates, y = poverty$Poverty)

plot(x = poverty$Graduates, y = lm_pov_grad$residuals, pch=19, col=COL[1,2], ylab = "", xlab = "", axes = FALSE, ylim = c(-5.5,5.5))
makeTube(x = poverty$Graduates, y = lm_pov_grad$residuals, addLine = FALSE)
axis(1, at = c(80,90,95))
axis(2, at = c(-4, 0, 4))
box()
abline(h = 0, lty = 2)

dev.off()

# categorical predictor, binary

poverty$region2 = NA

poverty$region2[poverty$State == "Maine" |
    poverty$State == "Vermont" |
    poverty$State == "New Hampshire" |
    poverty$State == "Massachusetts" |
    poverty$State == "Connecticut" |
    poverty$State == "Rhode Island" |
    poverty$State == "New York" |
    poverty$State == "New Jersey" |
    poverty$State == "Pennsylvania" |
    poverty$State == "Delaware" |
    poverty$State == "Maryland" |
    poverty$State == "West Virginia" |
    poverty$State == "Virginia" |
    poverty$State == "District of Columbia" |
    poverty$State == "North Carolina" |
    poverty$State == "South Carolina" |
    poverty$State == "Georgia" |
    poverty$State == "Florida" |
    poverty$State == "Alabama" |
    poverty$State == "Mississippi" |
    poverty$State == "Tennessee" |
    poverty$State == "Kentucky" |
    poverty$State == "Illinois" |
    poverty$State == "Indiana" |
    poverty$State == "Ohio" |
    poverty$State == "Michigan" |
    poverty$State == "Wisconsin"] = "east"
    
poverty$region2[poverty$State == "Washington" |
    poverty$State == "Oregon" |
    poverty$State == "California" |
    poverty$State == "Idaho" |
    poverty$State == "Nevada" |
    poverty$State == "Montana" |
    poverty$State == "Wyoming" |
    poverty$State == "Utah" |
    poverty$State == "Arizona" |
    poverty$State == "Colorado" |
    poverty$State == "New Mexico" |
    poverty$State == "North Dakota" |
    poverty$State == "South Dakota" |
    poverty$State == "Nebraska" |
    poverty$State == "Kansas" |
    poverty$State == "Oklahoma" |
    poverty$State == "Texas" |
    poverty$State == "Minnesota" |
    poverty$State == "Iowa" |
    poverty$State == "Missouri" |
    poverty$State == "Arkansas" |
    poverty$State == "Louisiana" |
    poverty$State == "Alaska" |
    poverty$State == "Hawaii" ] = "west"
    
poverty$region2 = as.factor(poverty$region2)

summary(lm(poverty$Poverty ~ poverty$region2))

# categorical predictor, non-binary

northeast = c("Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont", "New Jersey", "New York", "Pennsylvania")

midwest = c("Illinois", "Indiana", "Iowa", "Kansas", "Michigan", "Minnesota", "Missouri", "Nebraska", "North Dakota", "Ohio", "South Dakota", "Wisconsin")

west = c("Montana", "Wyoming", "Colorado", "New Mexico", "Idaho", "Utah", "Arizona", "Nevada", "Washington", "Oregon", "California", "Alaska", "Hawaii")

south = c("Delaware", "Maryland", "District of Columbia", "Virginia", "West Virginia", "North Carolina", "South Carolina", "Georgia", "Florida", "Kentucky", "Tennessee", "Mississippi", "Alabama", "Oklahoma", "Texas", "Arkansas", "Louisiana")

d$region4 = NA
poverty$region4[poverty$State %in% northeast] = "northeast"
poverty$region4[poverty$State %in% midwest] = "midwest"
poverty$region4[poverty$State %in% west] = "west"
poverty$region4[poverty$State %in% south] = "south"
poverty$region4 = factor(poverty$region4, levels = c("northeast", "midwest", "west", "south"))

xtable(summary(lm(poverty$Poverty ~ poverty$region4)), digits = 2)




