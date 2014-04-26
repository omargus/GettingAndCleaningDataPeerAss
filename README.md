GettingAndCleaningDataPeerAss
=============================
#The script run_analysis.R Works in the following way:

First the working directory is set in the UCI HAR Dataset that was downloaded and extracted.  The filestructure in the directory is unchanged from the extracted set.

##Data read in:
The script reads data from the "features" and "acitivity_labels" text files to R data frames.  Then files that are specific for each of the two datasets (training and test) are read into R data frames.  There are three files for each set that include 1)Subject number, 2) Activity and 3) measurements. 

##Building and combining data frames:
For each of the two sets a data frame is built using cbind(), combining the subject number, activity number and the measurements.  The "features.txt" file is used as column names for the meaurements.
Finally the two data sets are combined using rbind().

##Filtering data :
To extract only columns with means and standard deviations I used grepl and searched for either "mean()" or std() in the column names.  66 columns with measurements were extracted.

##Renaming activity labels:
To rename the values in the activity column mapvalues() from the plyr package was used exchange numbers and descriptive labels (use labels from "activity_labels.txt").

##Calculating means for the 66 variables for each subject and each activity
Use aggregate() to calculate means for all the measurements for each subject and each activity. Resulting in a tidy dataset with 180 rows (6 activities x 30 subjects) and 68 columns (one for each measurement (66 total), one for subject number and one for activity.

##Output the tidy Data
Use write.csv() to export the data to a text file.
