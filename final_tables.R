library(xlsx)
options(stringsAsFactors=FALSE)
table.1.2 <- read.xlsx("data/new_tables.xlsx", 2, header=TRUE, as.data.frame=TRUE)

rownames(table.1.2) <- table.1.2[,1]
table.1.2 <- table.1.2[,-1]
for(i in 1:dim(table.1.2)[2]) table.1.2[,i]=as.numeric(table.1.2[,i])
post.idx <- grep("post", colnames(table.1.2))
change.val <- table.1.2[,post.idx] - table.1.2[,post.idx-1]
change.val.percentage <- (change.val/table.1.2[,post.idx-1])*100
colnames(change.val.percentage) <- c("Patient_1_change_%", "Patient_2_change_%", "Patient_3_change_%")


table.3 <- read.xlsx("data/new_tables.xlsx", 3, header=TRUE, as.data.frame=TRUE)
rownames(table.3) <- table.3[,1]
table.3 <- table.3[,-1]
for(i in 1:dim(table.3)[2]) table.3[,i]=as.numeric(table.3[,i])

post.idx <- grep("post", colnames(table.3))
change.val <- table.3[,post.idx] - table.3[,post.idx-1]
change.val.percentage <- (change.val/table.3[,post.idx-1])*100
colnames(change.val.percentage) <- c("Patient_1_change_%", "Patient_2_change_%", "Patient_3_change_%")

