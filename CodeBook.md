# Codebook | Human Activity Recognition Using Smartphones Data Set

The UCI Human Activity Recognition Using Smartphones Data Set (HAR Data Set)
is divided into two data sets a `test` and `train` set. The R script reads in
each of those data sets doing the following transformations to generate a
single tidy data set. This tidy data set averages the mean and standard
deviation variables from the HAR Data Set grouping by the subject and the
activity.

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

### Grouping Variables
1. subject: integer
   - identifying the volunteer who performed the activities
2. activity_label: factor (6 values)
   - LAYING
   - SITTING
   - STANDING
   - WALKING
   - WALKING_DOWNSTAIRS
   - WALKING_UPSTAIRS

### Measurements

Each value is a double-precision vector summarizing the average of all
measurements of the subject's activity. The data set only reports back the
mean and standard deviation means from each group of observations in the
original data set.

1. avg.tBodyAcc.mean.X : double
2. avg.tBodyAcc.mean.Y: double
3. avg.tBodyAcc.mean.Z: double
4. avg.tBodyAcc.std.X: double
5. avg.tBodyAcc.std.Y: double
6. avg.tBodyAcc.std.Z: double
7. avg.tGravityAcc.mean.X: double
8. avg.tGravityAcc.mean.Y: double
9. avg.tGravityAcc.mean.Z: double
10. avg.tGravityAcc.std.X: double
11. avg.tGravityAcc.std.Y: double
12. avg.tGravityAcc.std.Z: double
13. avg.tBodyAccJerk.mean.X: double
14. avg.tBodyAccJerk.mean.Y: double
15. avg.tBodyAccJerk.mean.Z: double
16. avg.tBodyAccJerk.std.X: double
17. avg.tBodyAccJerk.std.Y: double
18. avg.tBodyAccJerk.std.Z: double
19. avg.tBodyGyro.mean.X: double
20. avg.tBodyGyro.mean.Y: double
21. avg.tBodyGyro.mean.Z: double
22. avg.tBodyGyro.std.X: double
23. avg.tBodyGyro.std.Y: double
24. avg.tBodyGyro.std.Z: double
25. avg.tBodyGyroJerk.mean.X: double
26. avg.tBodyGyroJerk.mean.Y: double
27. avg.tBodyGyroJerk.mean.Z: double
28. avg.tBodyGyroJerk.std.X: double
29. avg.tBodyGyroJerk.std.Y: double
30. avg.tBodyGyroJerk.std.Z: double
31. avg.tBodyAccMag.mean: double
32. avg.tBodyAccMag.std: double
33. avg.tGravityAccMag.mean: double
34. avg.tGravityAccMag.std: double
35. avg.tBodyAccJerkMag.mean: double
36. avg.tBodyAccJerkMag.std: double
37. avg.tBodyGyroMag.mean: double
38. avg.tBodyGyroMag.std: double
39. avg.tBodyGyroJerkMag.mean: double
40. avg.tBodyGyroJerkMag.std: double
41. avg.fBodyAcc.mean.X: double
42. avg.fBodyAcc.mean.Y: double
43. avg.fBodyAcc.mean.Z: double
44. avg.fBodyAcc.std.X: double
45. avg.fBodyAcc.std.Y: double
46. avg.fBodyAcc.std.Z: double
47. avg.fBodyAcc.meanFreq.X: double
48. avg.fBodyAcc.meanFreq.Y: double
49. avg.fBodyAcc.meanFreq.Z: double
50. avg.fBodyAccJerk.mean.X: double
51. avg.fBodyAccJerk.mean.Y: double
52. avg.fBodyAccJerk.mean.Z: double
53. avg.fBodyAccJerk.std.X: double
54. avg.fBodyAccJerk.std.Y: double
55. avg.fBodyAccJerk.std.Z: double
56. avg.fBodyAccJerk.meanFreq.X: double
57. avg.fBodyAccJerk.meanFreq.Y: double
58. avg.fBodyAccJerk.meanFreq.Z: double
59. avg.fBodyGyro.mean.X: double
60. avg.fBodyGyro.mean.Y: double
61. avg.fBodyGyro.mean.Z: double
62. avg.fBodyGyro.std.X: double
63. avg.fBodyGyro.std.Y: double
64. avg.fBodyGyro.std.Z: double
65. avg.fBodyGyro.meanFreq.X: double
66. avg.fBodyGyro.meanFreq.Y: double
67. avg.fBodyGyro.meanFreq.Z: double
68. avg.fBodyAccMag.mean: double
69. avg.fBodyAccMag.std: double
70. avg.fBodyAccMag.meanFreq: double
71. avg.fBodyBodyAccJerkMag.mean: double
72. avg.fBodyBodyAccJerkMag.std: double
73. avg.fBodyBodyAccJerkMag.meanFreq: double
74. avg.fBodyBodyGyroMag.mean: double
75. avg.fBodyBodyGyroMag.std: double
76. avg.fBodyBodyGyroMag.meanFreq: double
77. avg.fBodyBodyGyroJerkMag.mean: double
78. avg.fBodyBodyGyroJerkMag.std: double
79. avg.fBodyBodyGyroJerkMag.meanFreq: double
80. avg.angle.tBodyAccMean.gravity: double
81. avg.angle.tBodyAccJerkMean.gravityMean: double
82. avg.angle.tBodyGyroMean.gravityMean: double
83. avg.angle.tBodyGyroJerkMean.gravityMean: double
84. avg.angle.X.gravityMean: double
85. avg.angle.Y.gravityMean: double
86. avg.angle.Z.gravityMean: double
