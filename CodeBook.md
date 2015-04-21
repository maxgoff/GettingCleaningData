
# CodeBook

This is the code book that describes the variables, the data, and the transformations performed.

## The data source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information (taken from the dataset's README)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


## Transformation details

There are 5 parts, per the assignment specification:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive activity names.
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

## How ```run_analysis.R``` # implements the above steps:

* Require ```plyr``` and ```data.table``` packanges.
* Load both test and train data
* Load the features and activity labels.
* Extract the mean and standard deviation column names and data.
* Process the data, including both test and train data sets.

## Variable names 

Variable name extracted from original dataset                  Variable in tidy file
 tBodyAcc-mean()-X                                             TimeBodyAcclMeanX
 tBodyAcc-mean()-Y                                             TimeBodyAcclMeanY
 tBodyAcc-mean()-Z                                             TimeBodyAcclMeanZ
 tBodyAcc-std()-X                                              TimeBodyAcclSTDX
 tBodyAcc-std()-Y                                              TimeBodyAcclSTDY
 tBodyAcc-std()-Z                                              TimeBodyAcclSTDZ
 tGravityAcc-mean()-X                                          TimeGravityAcclMeanX
 tGravityAcc-mean()-Y                                          TimeGravityAcclMeanY
 tGravityAcc-mean()-Z                                          TimeGravityAcclMeanZ
 tGravityAcc-std()-X                                           TimeGravityAcclSTDX
 tGravityAcc-std()-Y                                           TimeGravityAcclSTDY
 tGravityAcc-std()-Z                                           TimeGravityAcclSTDZ
 tBodyAccJerk-mean()-X                                         TimeBodyAcclJerkMeanX
 tBodyAccJerk-mean()-Y                                         TimeBodyAcclJerkMeanY
 tBodyAccJerk-mean()-Z                                         TimeBodyAcclJerkMeanZ
 tBodyAccJerk-std()-X                                          TimeBodyAcclJerkSTDX
 tBodyAccJerk-std()-Y                                          TimeBodyAcclJerkSTDY
 tBodyAccJerk-std()-Z                                          TimeBodyAcclJerkSTDZ
 tBodyGyro-mean()-X                                            TimeBodyAngSpeedMeanX
 tBodyGyro-mean()-Y                                            TimeBodyAngSpeedMeanY
 tBodyGyro-mean()-Z                                            TimeBodyAngSpeedMeanZ
 tBodyGyro-std()-X                                             TimeBodyAngSpeedSTDX
 tBodyGyro-std()-Y                                             TimeBodyAngSpeedSTDY
 tBodyGyro-std()-Z                                             TimeBodyAngSpeedSTDZ
 tBodyGyroJerk-mean()-X                                        TimeBodyAngAcclMeanX
 tBodyGyroJerk-mean()-Y                                        TimeBodyAngAcclMeanY
 tBodyGyroJerk-mean()-Z                                        TimeBodyAngAcclMeanZ
 tBodyGyroJerk-std()-X                                         TimeBodyAngAcclSTDX
 tBodyGyroJerk-std()-Y                                         TimeBodyAngAcclSTDY
 tBodyGyroJerk-std()-Z                                         TimeBodyAngAcclSTDZ
 tBodyAccMag-mean()                                            TimeBodyAcclMagnitudeMean
 tBodyAccMag-std()                                             TimeBodyAcclMagnitudeSTD
 tGravityAccMag-mean()                                         TimeGravityAcclMagnitudeMean
 tGravityAccMag-std()                                          TimeGravityAcclMagnitudeSTD
 tBodyAccJerkMag-mean()                                        TimeBodyAcclJerkMagnitudeMean
 tBodyAccJerkMag-std()                                         TimeBodyAcclJerkMagnitudeSTD
 tBodyGyroMag-mean()                                           TimeBodyAngSpeedMagnitudeMean
 tBodyGyroMag-std()                                            TimeBodyAngSpeedMagnitudeSTD
 tBodyGyroJerkMag-mean()                                       TimeBodyAngAcclMagnitudeMean
 tBodyGyroJerkMag-std()                                        TimeBodyAngAcclMagnitudeSTD
 fBodyAcc-mean()-X                                             FreqBodyAcclMeanX
 fBodyAcc-mean()-Y                                             FreqBodyAcclMeanY
 fBodyAcc-mean()-Z                                             FreqBodyAcclMeanZ
 fBodyAcc-std()-X                                              FreqBodyAcclSTDX
 fBodyAcc-std()-Y                                              FreqBodyAcclSTDY
 fBodyAcc-std()-Z                                              FreqBodyAcclSTDZ
 fBodyAcc-meanFreq()-X                                         FreqBodyAcclMeanFreqX
 fBodyAcc-meanFreq()-Y                                         FreqBodyAcclMeanFreqY
 fBodyAcc-meanFreq()-Z                                         FreqBodyAcclMeanFreqZ
 fBodyAccJerk-mean()-X                                         FreqBodyAcclJerkMeanX
 fBodyAccJerk-mean()-Y                                         FreqBodyAcclJerkMeanY
 fBodyAccJerk-mean()-Z                                         FreqBodyAcclJerkMeanZ
 fBodyAccJerk-std()-X                                          FreqBodyAcclJerkSTDX
 fBodyAccJerk-std()-Y                                          FreqBodyAcclJerkSTDY
 fBodyAccJerk-std()-Z                                          FreqBodyAcclJerkSTDZ
 fBodyAccJerk-meanFreq()-X                                     FreqBodyAcclJerkMeanFreqX
 fBodyAccJerk-meanFreq()-Y                                     FreqBodyAcclJerkMeanFreqY
 fBodyAccJerk-meanFreq()-Z                                     FreqBodyAcclJerkMeanFreqZ
 fBodyGyro-mean()-X                                            FreqBodyAngSpeedMeanX
 fBodyGyro-mean()-Y                                            FreqBodyAngSpeedMeanY
 fBodyGyro-mean()-Z                                            FreqBodyAngSpeedMeanZ
 fBodyGyro-std()-X                                             FreqBodyAngSpeedSTDX
 fBodyGyro-std()-Y                                             FreqBodyAngSpeedSTDY
 fBodyGyro-std()-Z                                             FreqBodyAngSpeedSTDZ
 fBodyGyro-meanFreq()-X                                        FreqBodyAngSpeedMeanFreqX
 fBodyGyro-meanFreq()-Y                                        FreqBodyAngSpeedMeanFreqY
 fBodyGyro-meanFreq()-Z                                        FreqBodyAngSpeedMeanFreqZ
 fBodyAccMag-mean()                                            FreqBodyAcclMagnitudeMean
 fBodyAccMag-std()                                             FreqBodyAcclMagnitudeSTD
 fBodyAccMag-meanFreq()                                        FreqBodyAcclMagnitudeMeanFreq
 fBodyBodyAccJerkMag-mean()                                    FreqBodyAcclJerkMagnitudeMean
 fBodyBodyAccJerkMag-std()                                     FreqBodyAcclJerkMagnitudeSTD
 fBodyBodyAccJerkMag-meanFreq()                                FreqBodyAcclJerkMagnitudeMeanFreq
 fBodyBodyGyroMag-mean()                                       FreqBodyAngSpeedMagnitudeMean
 fBodyBodyGyroMag-std()                                        FreqBodyAngSpeedMagnitudeSTD
 fBodyBodyGyroMag-meanFreq()                                   FreqBodyAngSpeedMagnitudeMeanFreq
 fBodyBodyGyroJerkMag-mean()                                   FreqBodyAngAcclMagnitudeMean
 fBodyBodyGyroJerkMag-std()                                    FreqBodyAngAcclMagnitudeSTD
 fBodyBodyGyroJerkMag-meanFreq()                               FreqBodyAngAcclMagnitudeMeanFreq
