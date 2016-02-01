if(!require(dplyr)){
  install.packages("dplyr")
}

library(dplyr)


temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)

actlab <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))
feat <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))

sbj_tt <- read.table("UCI HAR Dataset/test/subject_test.txt", sep ="")
sbj_tr <- read.table("UCI HAR Dataset/train/subject_train.txt", sep ="")
x_tr <- read.table("UCI HAR Dataset/train/X_train.txt", sep ="")
y_tr <- read.table("UCI HAR Dataset/train/y_train.txt", sep ="")
x_tt <- read.table("UCI HAR Dataset/test/X_test.txt", sep ="")
y_tt <- read.table("UCI HAR Dataset/test/y_test.txt", sep ="") 

unlink(temp)

SBJ <- rbind(sbj_tt, sbj_tr)
ACT <- rbind(y_tt, y_tr)
ID_ACT <- cbind(SBJ, ACT)
colnames(ID_ACT) <- c("ID", "Activity")

NEW <- select(merge(actlab, ID_ACT, by.x = "V1" , by.y = "Activity"), V2, ID)
colnames(NEW) <- c("Activity","ID")
DATA <- rbind(x_tt, x_tr)
colnames(DATA) <- feat[,2]

DB <- cbind(NEW, DATA[,grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", colnames(DATA))])

rm(list=setdiff(ls(), "DB"))

DB2 <- summarise_each(group_by(group_by(DB, Activity), ID, add = TRUE), funs(mean))

saveRDS(DB, file = "Tidy Dataset 1.rds", ascii=TRUE)
saveRDS(DB2, file = "Tidy Dataset 2.rds", ascii=TRUE)
