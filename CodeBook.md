# Codebook | Human Activity Recognition Using Smartphones Data Set

The UCI Human Activity Recognition Using Smartphones Data Set (HAR Data Set)
is divided into two data sets a `test` and `train` set. The R script reads in
each of those data sets doing the following transformations to generate a
single tidy data set. This tidy data set averages the mean and standard
deviation variables from the HAR Data Set grouping by the subject and the
activity.

## Processing

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

## Caveats
- The output was centered on the `subject` and `activity_label` since the
  use of the output would appear to be aimed toward gauging how
  individuals perform or behave differently. This makes the output long
  (180 rows) rather than wide.
- Mean and standard deviation columns were identified based on the
  presence of mean or std in the column name. This is a broad measurement
  since this also includes variables in the original data set that are
  aggregating the angle between vectors using an `angle()` function. It
  seems more sensible to be inclusive since data can be taken away
  later.

## Variables

1. subject: integer range of 1 to 30.
2. activity_label: factor (6 values)
   - LAYING
   - SITTING
   - STANDING
   - WALKING
   - WALKING_DOWNSTAIRS
   - WALKING_UPSTAIRS
3. avg.tBodyAcc.mean.X
4. avg.tBodyAcc.mean.Y
5. avg.tBodyAcc.mean.Z
6. avg.tBodyAcc.std.X
7. avg.tBodyAcc.std.Y
8. avg.tBodyAcc.std.Z
9. avg.tGravityAcc.mean.X
10. avg.tGravityAcc.mean.Y
11. avg.tGravityAcc.mean.Z
12. avg.tGravityAcc.std.X
13. avg.tGravityAcc.std.Y
14. avg.tGravityAcc.std.Z
15. avg.tBodyAccJerk.mean.X
16. avg.tBodyAccJerk.mean.Y
17. avg.tBodyAccJerk.mean.Z
18. avg.tBodyAccJerk.std.X
19. avg.tBodyAccJerk.std.Y
20. avg.tBodyAccJerk.std.Z
21. avg.tBodyGyro.mean.X
22. avg.tBodyGyro.mean.Y
23. avg.tBodyGyro.mean.Z
24. avg.tBodyGyro.std.X
25. avg.tBodyGyro.std.Y
26. avg.tBodyGyro.std.Z
27. avg.tBodyGyroJerk.mean.X
28. avg.tBodyGyroJerk.mean.Y
29. avg.tBodyGyroJerk.mean.Z
30. avg.tBodyGyroJerk.std.X
31. avg.tBodyGyroJerk.std.Y
32. avg.tBodyGyroJerk.std.Z
33. avg.tBodyAccMag.mean
34. avg.tBodyAccMag.std
35. avg.tGravityAccMag.mean
36. avg.tGravityAccMag.std
37. avg.tBodyAccJerkMag.mean
38. avg.tBodyAccJerkMag.std
39. avg.tBodyGyroMag.mean
40. avg.tBodyGyroMag.std
41. avg.tBodyGyroJerkMag.mean
42. avg.tBodyGyroJerkMag.std
43. avg.fBodyAcc.mean.X
44. avg.fBodyAcc.mean.Y
45. avg.fBodyAcc.mean.Z
46. avg.fBodyAcc.std.X
47. avg.fBodyAcc.std.Y
48. avg.fBodyAcc.std.Z
49. avg.fBodyAcc.meanFreq.X
50. avg.fBodyAcc.meanFreq.Y
51. avg.fBodyAcc.meanFreq.Z
52. avg.fBodyAccJerk.mean.X
53. avg.fBodyAccJerk.mean.Y
54. avg.fBodyAccJerk.mean.Z
55. avg.fBodyAccJerk.std.X
56. avg.fBodyAccJerk.std.Y
57. avg.fBodyAccJerk.std.Z
58. avg.fBodyAccJerk.meanFreq.X
59. avg.fBodyAccJerk.meanFreq.Y
60. avg.fBodyAccJerk.meanFreq.Z
61. avg.fBodyGyro.mean.X
62. avg.fBodyGyro.mean.Y
63. avg.fBodyGyro.mean.Z
64. avg.fBodyGyro.std.X
65. avg.fBodyGyro.std.Y
66. avg.fBodyGyro.std.Z
67. avg.fBodyGyro.meanFreq.X
68. avg.fBodyGyro.meanFreq.Y
69. avg.fBodyGyro.meanFreq.Z
70. avg.fBodyAccMag.mean
71. avg.fBodyAccMag.std
72. avg.fBodyAccMag.meanFreq
73. avg.fBodyBodyAccJerkMag.mean
74. avg.fBodyBodyAccJerkMag.std
75. avg.fBodyBodyAccJerkMag.meanFreq
76. avg.fBodyBodyGyroMag.mean
77. avg.fBodyBodyGyroMag.std
78. avg.fBodyBodyGyroMag.meanFreq
79. avg.fBodyBodyGyroJerkMag.mean
80. avg.fBodyBodyGyroJerkMag.std
81. avg.fBodyBodyGyroJerkMag.meanFreq
82. avg.angle.tBodyAccMean.gravity
83. avg.angle.tBodyAccJerkMean.gravityMean
84. avg.angle.tBodyGyroMean.gravityMean
85. avg.angle.tBodyGyroJerkMean.gravityMean
86. avg.angle.X.gravityMean
87. avg.angle.Y.gravityMean
88. avg.angle.Z.gravityMean
