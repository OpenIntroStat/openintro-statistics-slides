popular = read.csv("http://stat.duke.edu/courses/Fall12/sta101.001/data/popular.csv")


pdf('popular_mosaic.pdf', 5, 5)

par(mar=c(0,0,0,0))
mosaicplot(table(popular$grade,popular$goals), main = "", cex.axis = 1.5, las = 2)

dev.off()


pdf('popular.pdf', 7, 3)

chiTail(df = 4, U = 1.3121)
axis(1, at = 2.5, label = "1.3121", tick = FALSE, cex.axis = 2)

dev.off()