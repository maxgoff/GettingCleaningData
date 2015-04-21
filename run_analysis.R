
## Getting and Cleaning Data Project 
## The instructions for the assignment:
## Date Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## But before we start, we first make sure we have the packages and libraries we need.

if( !require("data.table")){
    install.packages("data.table")
}

if( !require("plyr")){
    install.packages("plyr")
}

library("data.table")
library("plyr")
## And we also need to get the archive and extract the files.

archURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


## 0. Get the archive, extracat the files, and get ready for processing

if( !file.exists("dataset")){
  download.file(archURL, destfile = "d.zip", method = "curl")
  unzip("d.zip")
  file.remove("d.zip")
  file.rename("UCI HAR Dataset", "dataset")
}

## now we read in all the data using read.table on the big files because fread blew up too many times

testX <-  read.table("dataset/test/X_test.txt")
testY <- read.table("dataset/test/y_test.txt")
testS <- fread("dataset/test/subject_test.txt")

trainX <- read.table("dataset/train/X_train.txt")
trainY <- read.table("dataset/train/y_train.txt")
trainS <- fread("dataset/train/subject_train.txt")

## 1. Merge the training and the test sets to create one data set.
bigX <- rbind(testX, trainX)
bigY <- rbind(testY, trainY)
bigS <- rbind(testS, trainS)
##  get the activities and features

activities <- fread("dataset/activity_labels.txt")
activities <- activities[, as.factor(activities$V2)]
features <- fread("dataset/features.txt")
features <- features[, as.factor(features$V2)]

names(bigX) <- features

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

vect <- grepl("-mean|-std", features)

bigX <- bigX[, vect]

## 3. Uses descriptive activity names to name the activities in the data set

newact <- c("ActivityID", "Activity")
 
bigY[,2] <- activities[bigY[,1]]
names(bigY) <- newact 
setnames(bigS, bigS[,1], "Subject")

## Consolidate data

bigData <- cbind(as.data.table(bigS), bigY, bigX)


## Eliminate the "AcitityID" column -- we don't need it

bigData[,2] <- NULL
## 4. Appropriately labels the data set with descriptive variable names. 

setnames(bigData, names(bigData), gsub('Acc',"Accl",names(bigData)))
setnames(bigData, names(bigData), gsub('GyroJerk',"AngAccl",names(bigData)))
setnames(bigData, names(bigData), gsub('Gyro',"AngSpeed",names(bigData)))
setnames(bigData, names(bigData), gsub('Mag',"Magnitude",names(bigData)))
setnames(bigData, names(bigData), gsub("BodyBody", "Body", names(bigData)))
setnames(bigData, names(bigData), gsub("tBody", "TimeBody", names(bigData)))
setnames(bigData, names(bigData), gsub("angle", "Angle", names(bigData)))
setnames(bigData, names(bigData), gsub("gravity", "Grav", names(bigData)))
setnames(bigData, names(bigData), gsub('^t',"Time",names(bigData)))
setnames(bigData, names(bigData), gsub('^f',"Freq",names(bigData)))
setnames(bigData, names(bigData), gsub('\\.mean',"Mean",names(bigData)))
setnames(bigData, names(bigData), gsub('-mean',"Mean",names(bigData)))
setnames(bigData, names(bigData), gsub('\\.std',"STD",names(bigData)))
setnames(bigData, names(bigData), gsub('-std',"STD",names(bigData)))
 
# aclean up any remaining unwanted characters in our labels
setnames(bigData, names(bigData), gsub('-',"", names(bigData)))
setnames(bigData, names(bigData), gsub( "[()]","", names(bigData)))
setnames(bigData, names(bigData), gsub('\\.',"", names(bigData)))

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Use ddply to create the tidy data set as specified ...

nBig = ddply(bigData, c("Subject","Activity"), numcolwise(mean))

# and finally save the tidy data set to disk.

write.table(nBig, file = "tidyData.txt", row.name=FALSE)
