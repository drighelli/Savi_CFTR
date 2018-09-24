options(stringsAsFactors=FALSE)
dataset <- read.table("data/CPET_FC_Luglio2018_1.csv", header=TRUE, sep="\t")


ds <- dataset[,-c(1,grep("PRED", colnames(dataset)))]

#on the mean
dds <- t(as.data.frame(apply(ds, 2, mean)))
post.idx <- grep("POST", colnames(ds))
change.val <- dds[,post.idx] - dds[,post.idx-1]
change.val.percentage <- (change.val/dds[,post.idx-1])*100
change.val.percentage <- t(as.data.frame(change.val.percentage))
colnames(change.val.percentage) <- gsub(".POST", ".Percentage", colnames(change.val.percentage))
write.xlsx(x=change.val.percentage, file="Percentage_Change_Values_on_Means.xls", row.names=FALSE)
#for each patient
post.idx <- grep("POST", colnames(ds))
change.val <- ds[,post.idx] - ds[,post.idx-1]
change.val.percentage <- (change.val/ds[,post.idx-1])*100
colnames(change.val.percentage) <- gsub(".POST", ".Percentage", colnames(change.val.percentage))
rownames(change.val.percentage) <- c(1:3)

write.xlsx(x=change.val.percentage, file="Percentage_Change_Values_on_Patients.xls", row.names=TRUE)
