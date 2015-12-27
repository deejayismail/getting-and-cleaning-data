library (reshape2)
#if file does not exist on the current directory, download it and then unzip it.
## Download and unzip the dataset:

if (!file.exists("getdata_dataset.zip")){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(url, "getdata_dataset.zip", method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip("getdata_dataset.zip") 
}


# Load the features and the activity label files

activity <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")


# Extract only the data on mean and standard deviation

meanSD <- grep(".*mean.*|.*std.*", features[,2])
meanSD.names <- features[meanSD,2]
meanSD.names <- gsub('-std', 'Std', meanSD.names)
meanSD.names <- gsub('[-()]', '', meanSD.names)
meanSD.names <- gsub('-mean', 'Mean', meanSD.names)

# Load all the datasets, traning and test:

test <- read.table("UCI HAR Dataset/test/X_test.txt")[meanSD]
dataTestActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
dataTestSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(dataTestSubjects, dataTestActivities, test)

train <- read.table("UCI HAR Dataset/train/X_train.txt")[meanSD]
dataTrainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
dataTrainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(dataTrainSubjects, dataTrainActivities, train)


# merge the training and test datasets and add the column names

finalData <- rbind(train, test) #bind the rows
colnames(finalData) <- c("subject", "activity", meanSD.names)

finalData$activity <- factor(finalData$activity, levels = activity[,1], labels = activity[,2])
finalData$subject <- as.factor(finalData$subject)
#export data into a text file called tidty.txt
finalData.melted <- melt(finalData, id = c("subject", "activity"))
finalData.mean <- dcast(finalData.melted, subject + activity ~ variable, mean)
write.table(finalData.mean, "tidy.txt", row.names = FALSE)
