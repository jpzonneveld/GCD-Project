## Coursera, Getting and Cleaning Data, February 2015
## Course project
## 
## Please view the README.md in this repo to understand the input, working and output of
## this script, including the prerequisites. 
## ASSUMPTIONS:   The raw data is downloaded and extracted into a folder called 
##                      "UCI HAR Dataset" present in the current working directory. 
##                The reshape2 package has been installed prior to running this script.

# Load required packages
library(reshape2)

# Read and combine the training datasets
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
train_full <- cbind(train_subject, train_activity, train_x)

# Read and combine the test datasets
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_activity <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
test_full <- cbind(test_subject, test_activity, test_x)

#Combine the test and train datasets into one dataframe
dataset_full <- rbind(train_full,test_full)

# Read the names of the coloumns from the features dataset
columnnames <- as.character(read.table("UCI HAR Dataset/features.txt")[,2])

# Assign the column names to dataset
names(dataset_full) <-  c("Subject", "ActivityNumber", columnnames)

# Read the activity descriptions from the activity_labels dataset
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("ActivityNumber", "Activity")

# Replace the activity numbers by activity descriptions
dataset_act <- merge(activity_labels, dataset_full, all=TRUE)

# Filter the columns for Mean and Standard Deviation (SD) from the columnnames
filter <- unique(grep(paste(c(".*mean\\().*", ".*std\\().*"), collapse= "|"), columnnames, value=TRUE))

# Apply the filter to the dataset to get only those coloumns that correspond to measurements of the mean or SD.
dataset_filter <- dataset_act[, c("Subject","Activity",filter)]

# Melt the filtered dataset into ID and measure variables
dataset_melt <- melt(dataset_filter, id.vars=c("Subject","Activity"))

# Cast the melted dataset and calulates the mean of all measurement variables for each activity and subject 
dataset_cast <- dcast(dataset_melt, Subject + Activity ~ variable, mean)

# Writes the clean dataset to a text file in a tab separated format
write.table(dataset_cast, "clean_dataset.txt", sep="\t", row.names=FALSE)