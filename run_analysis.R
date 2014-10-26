
# ******************************************************************************
# run_analysis.R
# 
# Executes the 5 steps defined in the "Getting and Cleaning Data" course project
# to clean a dataset related to wearable computing.
#
# autor: Marcelo Beninca
# repo: [R10019]\Course project
#
# ******************************************************************************

library(reshape2)

## 1. Merge the training and the test sets to create one data set.

# Loading the datasets. The "X_" files contain the meaasured vaariable
# observations; while the "Y_" files contain the activity label for each
# observation.
trainDir <- "./UCI HAR Dataset/train/"
testDir <- "./UCI HAR Dataset/test/"
x.train <- read.table(paste(trainDir, "X_train.txt", sep=""),
                      stringsAsFactors = FALSE)
y.train <- read.table(paste(trainDir, "Y_train.txt", sep=""),
                      stringsAsFactors = FALSE)
x.test <- read.table(paste(testDir, "X_test.txt", sep=""),
                      stringsAsFactors = FALSE)
y.test <- read.table(paste(testDir, "Y_test.txt", sep=""),
                      stringsAsFactors = FALSE)

# Merging train and test datasets (they have exactly the same columns):
dataset <- rbind(x.train, x.test)
activities <- rbind(y.train, y.test)


## 2. Extract only the measurements on the mean and standard deviation for each
## measurement.

# features table contains the feature codes and labels, in the same order they
# appear in the dataset.
features <- read.table("./UCI HAR Dataset/features.txt",
                       stringsAsFactors = FALSE)
names(features) <- c("feature.code", "feature.label")

# Numeric vector with columns to be extracted:
mean.var <- grep("mean()", features$feature.label, value = FALSE, fixed = TRUE)
sd.var <- grep("std()", features$feature.label, value = FALSE, fixed = TRUE)
req.var <- sort(c(mean.var, sd.var))  # Alphabetic ordering.

# Extracting columns.
dataset <- dataset[, req.var]


## 3. Uses descriptive activity names to name the activities in the data set

# activity_labels table contains the activity codes and labels:
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                              stringsAsFactors = FALSE)
names(activity.labels) <- c("activity.code", "activity.label")
names(activities) <- "activity.code"

activities <- merge(x = activities, y = activity.labels, 
                   by.x = "activity.code", by.y = "activity.code")
activities <- subset(activities, select = -activity.code)

# merging dataset with activities (their rows relate to the same observations):
dataset <- cbind(dataset, activities)


## 4. Appropriately label the data set with descriptive variable names.

names(dataset) <- c(features$feature.label[req.var], "activity")


## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.

# Load data from subjects. Rows are the same as dataset.
subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                              stringsAsFactors = FALSE)
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                            stringsAsFactors = FALSE)
subjects <- rbind(subject.train, subject.test)
names(subjects) <- "subject"

# Merge dataset and subjects:
dataset <- cbind(dataset, subjects)

# Melt dataframe:
tidy.dataset <- melt(dataset, id.vars = c("subject", "activity"),
                     variable.name = "feature", value.name = "value")

# Average value of each feature, for each subject and each activity:
final.dataset <- ddply(tidy.dataset, .(subject, activity, feature),
                         summarize, mean = mean(value))

# Save dataset as a txt file:
if(!file.exists("./data")){dir.create("./data")}
write.table(final.dataset, "./data/finalDataset.txt", row.name = FALSE)
