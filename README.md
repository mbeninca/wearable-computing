## README.md

This repo contains the R code to collect and clean data related to wearable computing, as required by "Getting and Cleaning Data" course project, and the tidy dataset produced by the code that can be used for further analysis.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The code in the script file "run_analysis.R" requires that the raw data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip be available, unzipped, in the same directory where it is located. Note: this raw dataset was not loaded to GitHub.

The script file loads the following datasets from the raw data:

> ./UCI HAR Dataset/train/X_train.txt : accelerometer and gyroscope measurements of each observation in the train set. Each column represents a feature, coded by a number.

> ./UCI HAR Dataset/train/Y_train.txt : activity code of the activity performed on each observation in the train set.

> ./UCI HAR Dataset/test/X_test.txt : accelerometer and gyroscope measurements of each observation in the test set. Each column represents a feature, coded by a number.

> ./UCI HAR Dataset/test/Y_test.txt : activity code of the activity performed on each observation in the test set.

> ./UCI HAR Dataset/features.txt : table relating feature code (a number) with the feature label (a meaningful string).

> ./UCI HAR Dataset/activity_labels.txt : table relating activity code (a number) with the activity label (a meaningful string).

> ./UCI HAR Dataset/train/subject_train.txt : subject (volunteer) code for each observation in the train set.

> ./UCI HAR Dataset/test/subject_test.txt : subject (volunteer) code for each observation in the test set.

All datasets loaded are merged in order to produce a single dataset containing information about the subject, activity and mean and standard deviation of the features for each observation of the train set and test set.

Finally, the dataset is melted in order to produce a tidy table containing only 4 columns: subject number, activity label , feature label and average (over subject and activity) of the corresponding feature.
