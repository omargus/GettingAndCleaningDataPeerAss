##Set working directory that includes the Samsung Dataset
setwd('UCI HAR Dataset/')
##Reading in feature and Activity label data.
features <- read.table('features.txt')
activityLabels <- read.table('activity_labels.txt')

##Reading in Training set
subj_train <- read.table('train/subject_train.txt', col.names=c('Subj_nr'), colClasses="factor")
y_train <- read.table('train//y_train.txt', col.names=c("Activity"), colClasses="factor")
x_train <- read.table('train/X_train.txt', col.names=features$V2, check.names = FALSE)
Train_total <- cbind(subj_train, y_train, x_train)
##Reading in Test set
subj_test <- read.table('test/subject_test.txt', col.names=c('Subj_nr'), colClasses="factor")
y_test <- read.table('test//y_test.txt', col.names=c("Activity"), colClasses="factor")
x_test <- read.table('test/X_test.txt', col.names=features$V2, check.names = FALSE)
Test_total <- cbind(subj_test, y_test, x_test)
##Combine the test set and training set
Complete_set <- rbind(Test_total, Train_total)

#Find all features that include "mean()" and std(), outputs a logical vector.
mean_std_features <-grepl("mean()",features$V2, fixed=T)|grepl("std()",features$V2, fixed=T)

##Make a Filtered data frame that keeps only the mean and std measurements.
Filtered_set <-Complete_set[,c(1,2,which(mean_std_features)+2)]
##Use activityLabels data to rename the Activity column to make descriptive activity names, uses mapvalues from plyr package.
Filtered_set$Activity <- mapvalues(Filtered_set$Activity, from = as.character(activityLabels$V1), to = as.character(activityLabels$V2))
##Calculate means for the 66 variables for each subject and each activity
Subject_Activity_mean<-aggregate(Filtered_set[3:68], by = list(Subj_nr = Filtered_set$Subj_nr, Activity = Filtered_set$Activity), FUN=mean)
##Outputs the tidy Data
write.csv(Subject_Activity_mean, 'Subject_Activity_means.txt')