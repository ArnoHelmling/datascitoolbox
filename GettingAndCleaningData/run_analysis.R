#### Read Data ####
## read data for test set
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

## read data for train set
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## read feature 
features <- read.table("UCI HAR Dataset/features.txt")

## read activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")


#### Rename Columns and activities####
## rename columns of X_test and X_train according to features
names(features) <- c("index","label")
names(X_test) <- featurelabels[,"label"]
names(X_train) <- featurelabels[,"label"]

## rename values of y_test and y_train according to activity labels
y_test_factor <- factor(y_test[,1])
levels(y_test_factor) <- activity_labels[,2]
y_train_factor <- factor(y_train[,1])
levels(y_train_factor) <- activity_labels[,2]


#### add columns for activity factors and subject IDs ####
## activity factors
X_test <- cbind("activity"=y_test_factor,X_test)
X_train <- cbind("activity"=y_train_factor,X_train)

##subject IDs
names(subject_test) <- "subject"
names(subject_train) <- "subject"
X_test <- cbind("subject"=subject_test[,"subject"],X_test)
X_train <- cbind("subject"=subject_train[,"subject"],X_train)


#### Extract mean() and std() measurements + added columns ####
## for test
isMean_test <- grepl("mean()",names(X_test))
isStd_test <- grepl("std()",names(X_test))
isSubject_test  <- grepl("subject",names(X_test))
isActivity_test <- grepl("activity",names(X_test))
toBeExtracted_test <- isMean_test | isStd_test | isSubject_test | isActivity_test

## for train
isMean_train <- grepl("mean()",names(X_train))
isStd_train <- grepl("std()",names(X_train))
isSubject_train  <- grepl("subject",names(X_train))
isActivity_train <- grepl("activity",names(X_train))
toBeExtracted_train <- isMean_train | isStd_train | isSubject_train| isActivity_train

#### merge Test and train ####
X_merged <- rbind(trainX[,toBeExtracted_train],testX[,toBeExtracted_test])

#### create second, indenpendent tidy data set ####
library(reshape2)

X_second <- melt(X_merged,id.vars=c("subject","activity"))
X_final <- dcast(X_second, activity + subject ~ variable, mean)

#### create file ####
write.csv(X_final,"tidy_data.txt",row.names=FALSE)