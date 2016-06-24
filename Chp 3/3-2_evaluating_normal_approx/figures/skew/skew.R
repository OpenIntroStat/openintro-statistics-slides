library(openintro)
data(COL)

set.seed(123)
rs <- rgamma(100,1)
ls <- rbeta(100,3,0.5)

temp <- sort(rnorm(100))

st <- c(temp[16:85], rnorm(30,0,0.1))
lt <- c(temp[1:20]-rgamma(20,1), temp[21:80], temp[81:100]+rev(rgamma(20,1)))



myPDF("qq_rs.pdf", 4, 4, mgp=c(2,.7,0), mar=c(0,0,0,0))
qqnorm(rs, axes = F, xlab = "", ylab = "", pch = 19, col = COL[1,2], main = "")
qqline(rs, col = "#00000088")
#abline(mean(rs), sd(rs), col = "#00000088")
dev.off()


myPDF("qq_ls.pdf", 4, 4, mgp=c(2,.7,0), mar=c(0,0,0,0))
qqnorm(ls, axes = F, xlab = "", ylab = "", pch = 19, col = COL[1,2], main = "")
qqline(ls, col = "#00000088")
#abline(mean(ls), sd(ls), col = "#00000088")
dev.off()


myPDF("qq_st.pdf", 4, 4, mgp=c(2,.7,0), mar=c(0,0,0,0))
qqnorm(st, axes = F, xlab = "", ylab = "", pch = 19, col = COL[1,2], main = "")
qqline(st, col = "#00000088")
#abline(mean(st), sd(st), col = "#00000088")
dev.off()


myPDF("qq_lt.pdf", 4, 4, mgp=c(2,.7,0), mar=c(0,0,0,0))
qqnorm(lt, axes = F, xlab = "", ylab = "", pch = 19, col = COL[1,2], main = "")
qqline(lt, col = "#00000088")
#abline(mean(lt), sd(lt), col = "#00000088")
dev.off()

