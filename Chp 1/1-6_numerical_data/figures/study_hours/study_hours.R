library(openintro)
data(COL)

d = read.csv("study_hours.csv")

study_hours = d$study_hours[!is.na(d$study_hours)]

# box

myPDF('study_hours_box.pdf', 6, 4, mar=c(0.5,4,0,1), cex.axis = 1.5, cex.lab = 1.25)

boxPlot(study_hours, col = COL[1,3], ylab = "# of study hours / week")

dev.off()

# layout

myPDF("study_hours_box_layout.pdf", 6, 4)
par(mar=c(0.8,4,0,1), mgp=c(2.8, 0.7, 0), las=1)

boxPlot(study_hours, col = COL[1,3], ylab = "# of study hours / week", axes=FALSE, xlim = c(0,3.5), pch = 20)
axis(2)

arrows(2,0, 1.40,min(study_hours)-0.5, length=0.08)
text(2,0,'lower whisker', pos=4)

arrows(2, 8, 1.40, quantile(study_hours, 0.25), length=0.08)
text(2,8,expression(Q[1]~~'(first quartile)'), pos=4)

m <- median(study_hours)
arrows(2, m, 1.40, m, length=0.08)
text(2,m,'median', pos=4)

q <- quantile(study_hours, 0.75)
arrows(2, q, 1.40, q, length=0.08)
text(2,q,expression(Q[3]~~'(third quartile)'), pos=4)

arrows(2, 35, 1.40, 35, length=0.08)
text(2,35,'max whisker reach\n& upper whisker', pos=4)

arrows(2, 47, 1.40, 45, length=0.08)
arrows(2, 47, 1.40, 49, length=0.08)
text(2,47,'suspected outliers', pos=4)

points(rep(0.4, 99), rev(sort(study_hours))[1:99], cex=rep(1.5, 27), col=rep(COL[1,3], 99), pch=rep(20, 99))
points(rep(0.4, 99), sort(study_hours)[1:99], cex=rep(1, 27), col=rep(COL[2], 99), pch=rep(1, 99))

dev.off()