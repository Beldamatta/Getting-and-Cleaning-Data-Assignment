### Getting-and-Cleaning-Data-Assignment
Deliverables for the final assignment of Coursera's Getting and Cleaning Data class. It contains the data and instructions to prepare the data on Human Activity recognition to run an analysis.
# Dataset
[Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
# Files
* ```CodeBook.md``` a codebook that describes the variables, the data, and any transformations that were made to prepare the data
* ```run_analysis.R``` performs the data transformation following the five steps required by the assignment:
  *  Merge the training and the test sets to create one data set.
  *  Extract only the measurements on the mean and standard deviation for each measurement. 
  *  Use descriptive activity names to name the activities in the data set
  *  Appropriately label the data set with descriptive variable names. 
  *  From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
* ```Average_TidyData.txt``` contains the data resulted from the last step and after following the sequence of steps, containing the average of each variable grouped by activity and subject.  
