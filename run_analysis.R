### Getting and Cleaning Data final assignment

library(dplyr) # loading the package

## Download the dataset

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./Data/UCI HAR Dataset.zip", method = "curl")
unzip("./Data/UCI HAR Dataset.zip", exdir = "./Data/")

## Assign data frames after downloading folder and extracting files

features <- read.table("./Data/UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activity <- read.table("./Data/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./Data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./Data/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("./Data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./Data/UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Merge training and test sets to create one data set

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

## Extract only measurements on the mean and st deviation
TidyData <- select(Merged_Data, subject, code, contains("mean"), contains("std"))

## Use descriptive activity names
TidyData$code <- activity[TidyData$code, 2]

## Appropriately label the data set with descriptive variable names
names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("mean", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("std", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))

## Create a second, independent tidy data set with the average of each variable
## for each activity and each subject

Average_TidyData <- TidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(Average_TidyData, "Average_TidyData.txt", row.name = FALSE)

