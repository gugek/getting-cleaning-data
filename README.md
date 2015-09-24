# Human Activity Recognition Using Smartphones Data Set

Project to collect, work with, and clean up the Human Activity Recognition
Using Smartphones Data Set.

## Script

The
[`run_analysis.R`](https://github.com/gugek/getting-cleaning-data/blob/master/run_analysis.R)
file processes the input data from the UCI Human Activity Recognition dataaset
and generates an output file aggregating the averages of mean and standard
deviation variables by subject and activity.

1. Open the `features.txt` and then makes a vector of column headers for the
   `train` and `test` data sets.
2. For both the `train` and `test` data sets.
    + Read the `X` file containing the measurements into a data frame
    + Read the activity file containing the activity label for each observation
    + Read the subject file containing the identifier of the participant for
      each observartion
    + Add the activity labels column to the measurements data frame
    + Add the subject identifiers column to the measurements data frame
3. Create a new unified data frame using `rbind` to make a union of the `test`
   and `train` data frames
4. Use `dplyr` to make a `data.table` for the unified data.
5. Remove from the unified data table all variables that are not `subject`,
   `activity`, or contain a mean or standard deviation measurement.
6. Create a merged data table incorporating the unified data table and the
   values of the activity labels. This uses `dplyr` and `left_join`. An
   enclosing `select` is used to resort the columns.
7. Group the data table and then summarize by the averages of the mean and
   standard deviation columns
8. Rename the column names of the data table so that they are clear and
   understandable
9. Write the output in CSV format without the row names

## Codebook

The
[codebook](https://github.com/gugek/getting-cleaning-data/blob/master/CodeBook.md)
explains the variables, input data, and processing used to make the tidy
(output) file that `run_analysis.R` generates.

## Assignment

The purpose of this project is to demonstrate your ability to collect, work
with, and clean a data set. The goal is to prepare tidy data that can be used
for later analysis. You will be graded by your peers on a series of yes/no
questions related to the project. You will be required to submit: 1) a tidy
data set as described below, 2) a link to a Github repository with your script
for performing the analysis, and 3) a code book that describes the variables,
the data, and any transformations or work that you performed to clean up the
data called CodeBook.md. You should also include a README.md in the repo with
your scripts. This repo explains how all of the scripts work and how they are
connected.

One of the most exciting areas in all of data science right now is wearable
computing - see for example this
[article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies
like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced
algorithms to attract new users. The data linked to from the course website
represent data collected from the accelerometers from the Samsung Galaxy S
smartphone. A full description is available at the site where the data was
obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set
with the average of each variable for each activity and each subject.
