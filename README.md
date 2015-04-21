# Getting and Cleaning Data

## Course Project

The specification for the assignment states:

  You should create one R script called run_analysis.R that does the following.

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive activity names.
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Making it work

1. Download  ```run_analysis.R```.  Provided you have a working Internet connection, while running the script, it will download the data from the URL given in the assignment.
 
2. In Rstido: ```source("run_analysis.R")```
   On the command line: Rscript run_analysis.R```
   
   The script will generate a new file ```tiny_data.txt``` in your working directory.
   
   NOTE:  the data will remain in a new folder called ```dataset```.

## Dependencies

```run_analysis.R``` file will install the packages if needed (```data.table``` and ```plyr```). 

##  More Information

See the CodeBook in this repository for additional information.
