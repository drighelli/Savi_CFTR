# library(xlsx)
# data.upd <- read.xlsx("data/updated_28_09_18.xlsx",1, as.data.frame=TRUE, header=TRUE, stringAsFactors=FALSE)
data.upd <- read.table(file="data/updated_28_09_18.txt", header=TRUE, sep="\t", quote="", row.names=1, stringsAsFactors=FALSE)
dim(data.upd)

for(i in 1:dim(data.upd)[2]) data.upd[,i]=as.numeric(data.upd[,i])

post.idx <- grep("post", colnames(data.upd))
change.val <- data.upd[,post.idx] - data.upd[,post.idx-1]
change.val.percentage <- (change.val/data.upd[,post.idx-1])*100
colnames(change.val.percentage) <- c("Patient_1_change_%", "Patient_2_change_%", "Patient_3_change_%")
