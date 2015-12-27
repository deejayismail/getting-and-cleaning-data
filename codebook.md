# Code Book

This code book summarizes the resulting data fields in `tidy.txt`.

## Identifiers

* `subject` - The ID of the test subject
* `activity` - The type of activity performed when the corresponding measurements were taken

## Measurements

* `tBodyAccMeanX`
* `tBodyAccMeanY`
* `tBodyAccMeanZ`
* `tBodyAccStdX`
* `tBodyAccStdY`
* `tBodyAccStdZ`
* `tGravityAccMeanX`
* `tGravityAccMeanY`
* `tGravityAccMeanZ`
* `tGravityAccStdX`
* `tGravityAccStdY`
* `tGravityAccStdZ`
* `tBodyAccJerkMeanX`
* `tBodyAccJerkMeanY`
* `tBodyAccJerkMeanZ`
* `tBodyAccJerkStdX`
* `tBodyAccJerkStdY`
* `tBodyAccJerkStdZ`
* `tBodyGyroMeanX`
* `tBodyGyroMeanY`
* `tBodyGyroMeanZ`
* `tBodyGyroStdX`
* `tBodyGyroStdY`
* `tBodyGyroStdZ`
* `tBodyGyroJerkMeanX`
* `tBodyGyroJerkMeanY`
* `tBodyGyroJerkMeanZ`
* `tBodyGyroJerkStdX`
* `tBodyGyroJerkStdY`
* `tBodyGyroJerkStdZ`
* `tBodyAccMagMean`
* `tBodyAccMagStd`
* `tGravityAccMagMean`
* `tGravityAccMagStd`
* `tBodyAccJerkMagMean`
* `tBodyAccJerkMagStd`
* `tBodyGyroMagMean`
* `tBodyGyroMagStd`
* `tBodyGyroJerkMagMean`
* `tBodyGyroJerkMagStd`
* `fBodyAccMeanX`
* `fBodyAccMeanY`
* `fBodyAccMeanZ`
* `fBodyAccStdX`
* `fBodyAccStdY`
* `fBodyAccStdZ`
* `fBodyAccMeanFreqX`
* `fBodyAccMeanFreqY`
* `fBodyAccMeanFreqZ`
* `fBodyAccJerkMeanX`
* `fBodyAccJerkMeanY`
* `fBodyAccJerkMeanZ`
* `fBodyAccJerkStdX`
* `fBodyAccJerkStdY`
* `fBodyAccJerkStdZ`
* `fBodyAccJerkMeanFreqX`
* `fBodyAccJerkMeanFreqY`
* `fBodyAccJerkMeanFreqZ`
* `fBodyGyroMeanX`
* `fBodyGyroMeanY`
* `fBodyGyroMeanZ`
* `fBodyGyroStdX`
* `fBodyGyroStdY`
* `fBodyGyroStdZ`
* `fBodyGyroMeanFreqX`
* `fBodyGyroMeanFreqY`
* `fBodyGyroMeanFreqZ`
* `fBodyAccMagMean`
* `fBodyAccMagStd`
* `fBodyAccMagMeanFreq`
* `fBodyBodyAccJerkMagMean`
* `fBodyBodyAccJerkMagStd`
* `fBodyBodyAccJerkMagMeanFreq`
* `fBodyBodyGyroMagMean`
* `fBodyBodyGyroMagStd`
* `fBodyBodyGyroMagMeanFreq`
* `fBodyBodyGyroJerkMagMean`
* `fBodyBodyGyroJerkMagStd`
* `fBodyBodyGyroJerkMagMeanFreq`

## Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test

1. Get the data: Download the file and put the file in the data folder. Unzip the file. Get the list of the files such as activity_labels.txt, features_info.txt, features.txt etc. See the README.txt file for the detailed information on the dataset.

2. Read data from the targeted files: Make a big picture of the structure of the data frame that will be used in this project. Create separate columns for data and variable names across subject and activity. Read data from the files into the variables. Read the Activity files, Subject files, Features files using the function read.table. Look at the properties of the above variables using the 'str' function. For example str(dataActivityTest).

4. Merges the training and the test data sets to a single data set: Concatenate the data tables by rows, for this use the rbind function. For example, dataSubject <- rbind(dataSubjectTrain, dataSubjectTest). Set names to different variables. For example, names(dataSubject)<-c("subject"). Merge columns to get the data frame Data for all data using the 'cbind' function. Example, Data <- cbind(dataFeatures, dataCombine).

5. Extracts only the measurements on the mean and standard deviation for each measurement: Subset Name of Features by measurements on the mean and standard deviation i.e taken Names of Features with “mean()” or “std()”. Subset the data frame Data by selected names of Features using the subset function. Check the structures of the data frame Data using 'str' function again.

6. Uses descriptive activity names to name the activities in the data set: Read descriptive activity names from “activity_labels.txt”. Factorize Variable activity in the data frame Data using descriptive activity names. Check using the 'head' function.

7. Appropriately labels the data set with descriptive variable names: In the former part, variables activity and subject and names of the activities have been labelled using descriptive names.In this part, Names of Features will labelled using descriptive variable names. Use the 'gsub' function here. For example, names(Data)<-gsub("^t", "time", names(Data)). Perform a check using the names(Data) function.

8. Creates a second,independent tidy data set and output it: In this part,a second, independent tidy data set will be created with the average of each variable for each activity and each subject based on the data set in step 4. Use the library 'plyr'. Aggregate the data using aggregate function. Make a text file using the write.table function.
