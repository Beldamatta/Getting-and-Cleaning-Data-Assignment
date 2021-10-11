---
title: "CodeBook"
author: "Beldamatta"
date: "10/11/2021"
output: html_document
---
The ```run_analysis.R``` script performs the data preparation following the five
steps required in the description of the Peer-Graded Assignment:

**1.Download the data from the link to your computer and unzip it**

The data set is downloaded and unzipped to a folder named **UCI HAR Dataset**

**2. Assign the data to their respective variable**
 
  * ```features```<- ```feartures.txt```: the features for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
 
  * ```activity```<- ```activity_labels.txt```: list the activities performed by the subjects when corresponding measures were being taken and its labels.
  
  * ```subject_test```<- ```test/subject_test.txt```: contains test data of the 30% of the  volunteer subjects, 9 of the 30 volunteers selected for generating the test data.
  
  * ```x_test```<- ```test/X_test.txt```: contains recorded features test data.
  
  * ```y_test```<- ```test/y_test.txt```: contains the activities' labels of test data.
  
  * ```subject_train```<- ```train/subject_train.txt```: contains train data of the 70% of the  volunteer subjects, 21 of the 30 volunteers selected for generating the training data.
  
  * ```x_train```<- ```train/X_train.txt```: contains recorded features train data.
  
  * ```y_train```<- ```train/y_train.txt```: contains the activities' labels of train data.

**3. Merge training and test data sets to create a single data set**
  
  * ```X```is created by merging x_train and x_test using the function rbind().
  
  * ```Y```is created by merging y_train and y_test using the function rbind().
  
  * ```Subject``` is created by merging subject_train and subject_test using rbind().
  
  * ```Merged_Data```is created by merging Subject, Y and X using the function cbind().

**4. Extract only measurements on the mean and standard deviation**
  
  * Used the function select() to select subject, code, and variables that contained  "mean" and "std" in their names. Attributed the resulting data to table named **TidyData**.

**5. Use descriptive activity names**
  
  * Used data set activities (second column) to change the codes to the name of the activities performed.

**6. Appropriately label the data set with descriptive variable names**
  
  * ```code``` column is renamed into ```activity```.
  
  * All ```Acc``` in variables names replaced by ```Accelerometer```.
  
  * All ```Gyro``` in variables names replaced by ```Gyroscope```.
  
  * All names starting with character ```t``` had it replaced by ```Time```. 
  
  * ```BodyBody``` replaced by ```Body```.
  
  * All names stating with character ```f``` had it replaced by ```Frequency```.
  
  * All ```Mag``` in variables names replaced by ```Magnitude```

**7. Create an independent tidy data set from the data set in the previous step, with average of each variable for each activity and each subject**
  
  * ```Average_TidyData``` containing 180 rows and 88 columns is created by summarizing ```TidyData``` taking the mean of all variables grouped by subject and activity.
  
  * The second data set ```Average_TidyData``` is exported into ```Average_TidyData.txt``` file.
