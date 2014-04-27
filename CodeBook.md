#This file describes the input data and the output file (Subject_Activity_means.txt), and the briefly the steps performed to get there (see more in README.MD).

Input files downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The measurements in the input dataset are measurements from an accelerometer and a gyroscope in a Samsung Galaxy SII. 
30 subjects performed six different activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) with each subject performing each activity between 35-95 times.
The measurements are 561 values outputed for each activity performed, some of those are summary such as means and standard deviations for the raw measurements.  All the values that are outputed are described in 'features_info.txt' that comes with the dataset.
The data is split into two sets, training set(21 subjects) and test set (9 subjects).

The input data that used in the "run_analysis.R" script 

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set measurements (561 columns).
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set measurements (561 columns).
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt'
- 'test/subject_test.txt'

The "run_analysis.R" script first reads in the required text files and joins the the in a single data frame with 563 columns (Subject nr, Activity label, 561x measurements) and with measurements for all subjects (both test and training set).
The set is then filtered to make a new dataframe that contains only columns with values that are means and standard deviations of the raw measuements. This filtered dataset has 66 columns of mean() and std() values (plus Subject nr and activity). Activiy names replace class labels in this dataframe (use "activity_labels.txt")

Finally the data is summarized by calculating the mean value for all the repetitions performed, resulting in a data frame with 180 rows (6 activities, 30 subjects), and 68 columns (Subject nr, Activity, 66x measurements).

This summarized data frame is written to a text file (Subject_Activity_means.txt) and is the output of the script.
