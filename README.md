Project for Getting and Cleaning Data
=====================================
Author: Jeroen Zonneveld (https://github.com/jpzonneveld/GCD-Project)


Goal and background of the project
----------------------------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
Instructuion for the project

Data source
-----------

The data for this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

 
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Steps to reproduce this project
-------------------------------

1. Download and extract the data into a new folder in your working directory called: `UCI HAR Dataset`.
2. Install the `reshape2` package.
3. Run the `run_analysis.R` script.

Working of script
-----------------

The script performs the following operations:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Output
------

* Tidy dataset file `clean_dataset.txt` (tab-delimited text)
