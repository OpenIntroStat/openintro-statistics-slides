library(openintro)

data(email)

email$cc       = as.factor(ifelse(email$cc > 0, "yes", "no"))
email$attach   = as.factor(ifelse(email$attach > 0, "yes", "no"))
email$dollar   = as.factor(ifelse(email$dollar > 0, "yes", "no"))
email$inherit  = as.factor(ifelse(email$inherit > 0, "yes", "no"))
email$password = as.factor(ifelse(email$password > 0, "yes", "no"))


email$format       = as.factor(ifelse(email$format, "HTML", "Plain"))
email$sent_email   = as.factor(ifelse(email$sent_email, "yes", "no"))
email$image        = as.factor(ifelse(email$image, "yes", "no"))
email$from         = as.factor(ifelse(email$from, "yes", "no"))
email$to_multiple  = as.factor(ifelse(email$to_multiple, "yes", "no"))
email$re_subj      = as.factor(ifelse(email$re_subj, "yes", "no"))
email$exclaim_subj = as.factor(ifelse(email$exclaim_subj, "yes", "no"))
email$urgent_subj  = as.factor(ifelse(email$urgent_subj, "yes", "no"))

email$time = NULL
email$viagra = NULL



g_full = glm(spam ~ ., data=email, family=binomial)
summary(g_full)

pdf("spam1.pdf",height=4)
par(mar=c(5, 4, 0, 2) + 0.1)
set.seed(1)
jitter = rnorm(nrow(email), sd=0.08)
plot(g_full$fitted.values, email$spam+jitter,
     xlim=0:1, ylim=c(-0.5,1.5), axes=FALSE,
     xlab="Predicted probability", ylab="",
     col=COL[1,3], pch=16)
axis(1)
axis(2, at=c(0,1), labels=c("0 (not spam)", "1 (spam)"))
dev.off()


pdf("spam2.pdf",height=4)
par(mar=c(5, 4, 0, 2) + 0.1)
set.seed(1)
jitter = rnorm(nrow(email), sd=0.08)
plot(g_full$fitted.values, email$spam+jitter,
     xlim=0:1, ylim=c(-0.5,1.5), axes=FALSE,
     xlab="Predicted probability", ylab="",
     col=COL[1,3], pch=16)
axis(1)
axis(2, at=c(0,1), labels=c("0 (not spam)", "1 (spam)"))

abline(v=0.75,col='red',lwd=2)
dev.off()


pdf("spam3.pdf",height=4)
par(mar=c(5, 4, 0, 2) + 0.1)
set.seed(1)
jitter = rnorm(nrow(email), sd=0.08)
plot(g_full$fitted.values, email$spam+jitter,
     xlim=0:1, ylim=c(-0.5,1.5), axes=FALSE,
     xlab="Predicted probability", ylab="",
     col=COL[1,3], pch=16)
axis(1)
axis(2, at=c(0,1), labels=c("0 (not spam)", "1 (spam)"))

abline(v=0.75,col=COL[4],lwd=2)

text(0.9,1.4,"Spam")
text(0.3,1.4,"Not Spam")
dev.off()

pdf("spam4.pdf",height=4)
par(mar=c(5, 4, 0, 2) + 0.1)
set.seed(1)
jitter = rnorm(nrow(email), sd=0.08)
plot(g_full$fitted.values, email$spam+jitter,
     xlim=0:1, ylim=c(-0.5,1.5), axes=FALSE,
     xlab="Predicted probability", ylab="",
     col=COL[1,3], pch=16)
axis(1)
axis(2, at=c(0,1), labels=c("0 (not spam)", "1 (spam)"))

abline(v=0.75,col=COL[4],lwd=2)
abline(h=0.5,col=COL[4],lwd=2)

text(0.9,1.4,"Spam")
text(0.3,1.4,"Not Spam")
dev.off()


pdf("spam5.pdf",height=4)
par(mar=c(5, 4, 0, 2) + 0.1)
set.seed(1)
jitter = rnorm(nrow(email), sd=0.08)
plot(g_full$fitted.values, email$spam+jitter,
     xlim=0:1, ylim=c(-0.5,1.5), axes=FALSE,
     xlab="Predicted probability", ylab="",
     col=COL[1,3], pch=16)
axis(1)
axis(2, at=c(0,1), labels=c("0 (not spam)", "1 (spam)"))

abline(v=0.75,col=COL[4],lwd=2)
abline(h=0.5,col=COL[4],lwd=2)

text(0.3,1.4,"Not Spam")
text(0.9,1.4,"Spam")

t = table(email$spam, g_full$fitted.values>0.75)

text(0.3,0.625,paste0("False Neg (n=",t[2,1],")"))
text(0.9,0.625,paste0("True Pos (n=",t[2,2],")"))

text(0.3,-0.45,paste0("True Neg (n=",t[1,1],")"))
text(0.9,-0.45,paste0("False Pos (n=",t[1,2],")"))
dev.off()


for(i in 1:5)
{
    thres = c(0.75, 0.625, 0.5, 0.375, 0.25)[i]

    pdf(paste0("spam5-",i,".pdf"),height=4)
    par(mar=c(5, 4, 0, 2) + 0.1)
    set.seed(1)
    jitter = rnorm(nrow(email), sd=0.08)
    plot(g_full$fitted.values, email$spam+jitter,
         xlim=0:1, ylim=c(-0.5,1.5), axes=FALSE,
         xlab="Predicted probability", ylab="",
         col=COL[1,3], pch=16)
    axis(1)
    axis(2, at=c(0,1), labels=c("0 (not spam)", "1 (spam)"))

    abline(v=thres,col=COL[4],lwd=2)
    abline(h=0.5,col=COL[4],lwd=2)

    x1 = (thres-0.05)/2
    x2 = thres+0.05+(1-(thres+0.05))/2

    text(x1,1.4,"Not Spam")
    text(x2,1.4,"Spam")

    t = table(email$spam, g_full$fitted.values>thres)

    FN = t[2,1]
    FP = t[1,2]
    TP = t[2,2]
    TN = t[1,1]

    text(x1,0.625,paste0("False Neg (n=",FN,")"))
    text(x2,0.625,paste0("True Pos (n=",TP,")"))

    text(x1,-0.45,paste0("True Neg (n=",TN,")"))
    text(x2,-0.45,paste0("False Pos (n=",FP,")"))
    dev.off()

    cat("sen =",TP / (TP + FN),"\tspec = ",TN / (FP + TN),"\n")
}


Sensitivity = c(0.07356948, 0.106267, 0.1362398, 0.3051771, 0.5095368)
Specificity = c(0.9974676, 0.995498, 0.9952167, 0.9634215, 0.93640970)

pdf("sen_vs_spec1.pdf",width=4,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)
plot(Sensitivity ~ Specificity,xlim=c(0,1),ylim=c(0,1),pch=16, col = COL[1])
dev.off()


Sensitivity2 = c()
Specificity2 = c()
for(thres in seq(0,1,0.025))
{
    if (thres %in% c(0,0.75, 0.625, 0.5, 0.375, 0.25,1))
        next
    t = table(email$spam, g_full$fitted.values>thres)



    FN = t[2,1]
    FP = t[1,2]
    TP = t[2,2]
    TN = t[1,1]

    Sensitivity2 = c(Sensitivity2, TP / (TP + FN))
    Specificity2 = c(Specificity2, TN / (FP + TN))
}

pdf("sen_vs_spec2.pdf",width=4,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)
plot(Sensitivity ~ Specificity,xlim=c(0,1),ylim=c(0,1),pch=16,col=COL[1])
points(Specificity2, Sensitivity2,col=COL[4],pch=16,cex=0.5)
dev.off()


pdf("sen_vs_spec3.pdf",width=4,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)
plot(1-Specificity,Sensitivity,xlim=c(0,1),ylim=c(0,1),pch=16,col=COL[1])
points(1-Specificity2, Sensitivity2,col=COL[4],pch=16,cex=0.5)
dev.off()

####

library(ROCR)

pdf("ROC.pdf",width=4,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)
pred = prediction(g_full$fitted.values, email$spam)
perf = performance(pred,"tpr","fpr")
plot(perf)
abline(a=0,b=1,col="lightgrey")
dev.off()



g_refined = glm(spam ~ to_multiple+cc+image+attach+winner+password+line_breaks+format+re_subj+urgent_subj+exclaim_mess, data=email, family=binomial)
summary(g_refined)


pred_full = prediction( g_full$fitted.values, email$spam)
pred_refined = prediction( g_refined$fitted.values, email$spam)

aucs = round(c(performance(pred_full,"auc")@y.values[[1]], performance(pred_refined,"auc")@y.values[[1]]),3)

pdf("ROC_comp.pdf",width=6,height=6)
par(mar=c(5, 4, 2, 2) + 0.1)

plot(performance(pred_full,"tpr","fpr"), lwd = 2)
plot(performance(pred_refined,"tpr","fpr"),add=TRUE, col=COL[1], lwd = 2)
legend("bottomright",paste0(c("Full","Refined"), " (AUC: ",aucs,")"),col=c("black",COL[1]), lwd = 2, lty=1)

abline(a=0,b=1,col="lightgrey")

dev.off()



U = c()
p = c()
for(thres in seq(0,1,0.01))
{
    if (thres %in% c(0,1))
        next
    t = table(email$spam, g_full$fitted.values>thres)



    FN = t[2,1]
    FP = t[1,2]
    TP = t[2,2]
    TN = t[1,1]

    U = c(U, TP + TN - 50 * FP - 5 * FN)
    p = c(p,thres)   
}

pdf("utility.pdf",width=6,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)
plot(U ~ p,type='l')

points(0.75,1422,col=COL[4],lwd=2)
dev.off()


pdf("utility2.pdf",width=6,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)
plot(U[p>0.6] ~ p[p>0.6],type='l')

points(0.75,1422,col=COL[4],lwd=2)
dev.off()


pdf("utility3.pdf",width=6,height=4)
par(mar=c(5, 4, 2, 2) + 0.1)
plot(U[p>0.6] ~ p[p>0.6],type='l')

points(0.75,1422,col=COL[4],lwd=2)

i=which.max(U)
points(p[i],U[i],col=COL[1],pch=16)
dev.off()


pdf("utility4.pdf",height=4)
par(mar=c(5, 4, 0, 2) + 0.1)
set.seed(1)
jitter = rnorm(nrow(email), sd=0.08)
plot(g_full$fitted.values, email$spam+jitter,
     xlim=0:1, ylim=c(-0.5,1.5), axes=FALSE,
     xlab="Predicted probability", ylab="",
     col=COL[1,3], pch=16)
axis(1)
axis(2, at=c(0,1), labels=c("0 (not spam)", "1 (spam)"))

abline(v=p[i],col=COL[4],lwd=2)
dev.off()
