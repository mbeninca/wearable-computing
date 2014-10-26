## CodeBook.md

The file ./data/finaldataset.txt contains the tidy data from wearable computing by run_analysis.R script as described in the README file. It is a space separated text with the following variables:

    subject

numeric variable, ranging from 1 to 30. Represents the volunteer who collected the data.
    
    activity

character variable, one of the six activities executed by the volunteer (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
    
    feature

character variable. Labels indicating Means and Standard Deviations of body and gravitacional accelerometer and gyroscope measurements, in time and frequency domains, as described in ./UCI HAR Dataset/README.txt and ./UCI HAR Dataset/features_info.txt files. 

From ./UCI HAR Dataset/features_info.txt file:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> * tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

> The set of variables that were estimated from these signals are: 

> * mean(): Mean value
* std(): Standard deviation

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

> * gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean


    mean

numeric variable, computing the average of each feature over each subject and activity. Acceleration measurements are in in standard gravity units 'g'; angular velocities measured by gyroscope are in radians/second. 