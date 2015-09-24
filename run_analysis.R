# Getting and Cleaning Data
# Course Project - run_analysis.R
# AUTHOR: Sean Chen

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for
#    each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.

# get the data
library(data.table)
library(dplyr)
wd = "/Users/gugek/Desktop/Coursera/getting_cleaning_data/"

# open features
features_txt <- paste(wd, "course_project/UCI HAR Dataset/features.txt",
                     sep="")
features_names <- read.delim(features_txt, header=FALSE, sep="")
features_header <- features_names[,2]


# STEP 1: Merges the training and the test sets to create one data set.
# get training file
x_train_file <- paste(wd, "course_project/UCI HAR Dataset/train/X_train.txt",
                     sep="")
x_train_df <- read.delim(x_train_file, header=FALSE, sep = "",
                         col.names=features_header)
# get activity file
y_train_file <- paste(wd, "course_project/UCI HAR Dataset/train/y_train.txt",
                      sep="")
y_train_df <- read.delim(y_train_file, header=FALSE, sep = "",
                           col.names=c("activity"))

# get subject file
subject_train_file <- paste(wd, "course_project/UCI HAR Dataset/",
                            "train/subject_train.txt",
                            sep="")
subject_train_df <- read.delim(subject_train_file, header=FALSE, sep = "",
                               col.names=c("subject"))
# add subject column
x_train_df$subject <- subject_train_df$subject
# add activity column
x_train_df$activity <- y_train_df$activity

# get test file
x_test_file <- paste(wd, "course_project/UCI HAR Dataset/test/X_test.txt",
                     sep="")
x_test_df <- read.delim(x_test_file, header=FALSE, sep = "",
                        col.names=features_header)

# get activity file
y_test_file <- paste(wd, "course_project/UCI HAR Dataset/test/y_test.txt",
                      sep="")

y_test_df <- read.delim(y_test_file, header=FALSE, sep = "",
                           col.names=c("activity"))

# get subject file
subject_test_file <- paste(wd, "course_project/UCI HAR Dataset/",
                            "test/subject_test.txt",
                            sep="")
subject_test_df <- read.delim(subject_test_file, header=FALSE, sep = "",
                               col.names=c("subject"))
# add subject column
x_test_df$subject <- subject_test_df$subject
# add activity column
x_test_df$activity <- y_test_df$activity

# union of two test and train
har_df <- rbind(x_train_df, x_test_df)

# data.table for HAR data
d.har_df <- select(tbl_df(har_df), subject, activity, everything())

# STEP 2: Extracts only the measurements on the mean and standard deviation
# remove everything that isn't mean or std
d.har_df.trim <- select(d.har_df, subject, activity, matches('.*(mean|std).*'))


# STEP 3: Uses descriptive activity names to name the activities in the data set
# get activity_labels
activity_labels_file <- paste(wd,
    "course_project/UCI HAR Dataset/activity_labels.txt", sep="")
activity_labels_df <- read.delim(activity_labels_file, header=FALSE, sep = "",
                                col.names=c("activity", "activity_label"))


# merge the dataset and then resort the columns
d.tidy_har_df <- select(left_join(d.har_df.trim, activity_labels_df),
                        subject, activity, activity_label, everything())

# STEP 4: Appropriately labels the data set with descriptive variable names.
# update column names with the avg prefix
column_names <- names(d.tidy_har_df)
column_names <- column_names[4:length(column_names)]
for (column_name in column_names) {
    # iterate through and update each column that isn't subject or activity
    new_name <- paste("avg", column_name, sep=".")
    new_name <- gsub('\\.+', '.', new_name)  # multiple dot to one dot
    new_name <- gsub('\\.+$', '', new_name)  # trim end dots
    setnames(d.tidy_har_df, column_name, new_name )
}

# STEP 5: Create a creates a second, independent tidy data set with the
#         average of each variable for each activity and each subject.

# group by subject activity
by_subject_activity <- group_by(d.tidy_har_df, subject, activity_label)

# generate our table
by_subject_activity_mean_table <- by_subject_activity %>%
    summarize_each(funs(mean),  matches('.*(mean|std).*'))

write.csv(by_subject_activity_mean_table, "output.txt", row.names=FALSE)
