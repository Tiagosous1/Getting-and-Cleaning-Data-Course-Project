#### List of the original data sets inside the downloaded zip file:

 	 - 'README.txt': describes about the general information and background related to the data sets within the zip file.
	
 	 - 'features_info.txt': Shows information about the variables used on the feature vector.

   	 - 'features.txt': List of all features.

   	 - 'activity_labels.txt': Links the class labels with their activity name.

   	 - 'train/X_train.txt': Training set.

   	 - 'train/y_train.txt': Training labels.

   	 - 'test/X_test.txt': Test set.

   	 - 'test/y_test.txt': Test labels.
   
    	 - 'train/subject_train.txt':   Each row identifies the subject who performed the activity for each window sample.
            Its range is from 1 to 30. (for training set)
   
  	 - 'test/subject_test.txt':  Each row identifies the subject who performed the activity for each window sample.
  	    Its range is from 1 to 30. (for test set)
      
   	  The following data sets are not been used in the current project. 

   	 - 'train/Inertial Signals/total_acc_x_train.txt'; 'train/Inertial Signals/body_acc_x_train.txt';
   	   'train/Inertial Signals/body_gyro_x_train.txt'. More information related to these three data sets can be
   	    found in 'README.txt', 'feature_info.txt' and 'feature.txt' and the original website.

#### Background: feature selection, feature vector variables and unit

The following information is the hightlights/summary of the 'feature_info.txt' and 'feature.txt'

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly
partitioned into two sets, where 70% of the volunteers was selected for generating the training data
and 30% the test data.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ 
and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency
of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration
signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated 
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing BodyAcc-XYZ,
fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>		tBodyAcc-XYZ
>		tGravityAcc-XYZ
>		tBodyAccJerk-XYZ
>		tBodyGyro-XYZ
>		tBodyGyroJerk-XYZ
>		tBodyAccMag
>		tGravityAccMag
>		tBodyAccJerkMag
>		tBodyGyroMag
>		tBodyGyroJerkMag
>		fBodyAcc-XYZ
>		fBodyAccJerk-XYZ
>		fBodyGyro-XYZ
>		fBodyAccMag
>		fBodyAccJerkMag
>		fBodyGyroMag
>		fBodyGyroJerkMag

>	Additional vectors obtained by averaging the signals in a signal window sample. 
>	These are used on the angle() variable:

>		gravityMean
>		tBodyAccMean
>		tBodyAccJerkMean
>		tBodyGyroMean
>		tBodyGyroJerkMean

>	The set of variables that were estimated from these signals are: 

>		mean(): Mean value
>		std(): Standard deviation
>		mad(): Median absolute deviation 
>		max(): Largest value in array
>		min(): Smallest value in array
>		sma(): Signal magnitude area
>		energy(): Energy measure. Sum of the squares divided by the number of values. 
>		iqr(): Interquartile range 
>		entropy(): Signal entropy
>		arCoeff(): Autorregresion coefficients with Burg order equal to 4
>		correlation(): correlation coefficient between two signals
>		maxInds(): index of the frequency component with largest magnitude
>		meanFreq(): Weighted average of the frequency components to obtain a mean frequency
>		skewness(): skewness of the frequency domain signal 
>		kurtosis(): kurtosis of the frequency domain signal 
>		bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
>		angle(): Angle between to vectors.

##### Unit:

Features are normalized and bounded within [-1,1]. In other words, they are unitless.

##### Run analysis script

The ``run_analysis.R`` script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

Download the dataset
Dataset downloaded and extracted under the folder called ``UCI HAR Dataset``

Assign each data to variables
``feat`` <- ``features.txt`` : 561 rows, 2 columns, the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

``activit`` <- ``activity_labels.txt`` : 6 rows, 2 columns, list of activities performed when the corresponding measurements were taken and its codes (labels)

``subject_test`` <- ``test/subject_test.txt`` : 2947 rows, 1 column, contains test data of 9/30 volunteer test subjects being observed

``x_test`` <- ``test/X_test.txt`` : 2947 rows, 561 columns, contains recorded features test data

``y_test`` <- ``test/y_test.txt`` : 2947 rows, 1 columns, contains test data of activities’code labels

``subject_train`` <- ``test/subject_train.txt`` : 7352 rows, 1 column, contains train data of 21/30 volunteer subjects being observed

``x_train`` <- ``test/X_train.txt`` : 7352 rows, 561 columns, contains recorded features train data

``y_train`` <- ``test/y_train.txt`` : 7352 rows, 1 columns, contains train data of activities’code labels

Merges the training and the test sets to create one data set
``X`` (10299 rows, 561 columns) is created by merging ``x_train`` and ``x_test`` using rbind() function

``Y`` (10299 rows, 1 column) is created by merging ``y_train`` and ``y_test`` using rbind() function

``Subject`` (10299 rows, 1 column) is created by merging ``subject_train`` and ``subject_test`` using rbind() function

``total_data`` (10299 rows, 563 column) is created by merging ``Subject``, ``Y`` and ``X`` using cbind() function

Extracts only the measurements on the mean and standard deviation for each measurement
``Measure_data`` (10299 rows, 88 columns) is created by subsetting ``total_data``, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the Measure_data replaced with corresponding activity taken from second column of the activities variable

Appropriately labels the data set with descriptive variable names
code column in Measure_data renamed into activities
All Acc in column’s name replaced by Accelerometer

All Gyro in column’s name replaced by Gyroscope

All BodyBody in column’s name replaced by Body

All Mag in column’s name replaced by Magnitude

All start with character f in column’s name replaced by Frequency

All start with character t in column’s name replaced by Time

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
``Clean_data`` (180 rows, 88 columns) is created by sumarizing ``Measure_data`` taking the means of each variable for each activity and each subject, after groupped by subject and activity.

Export ``Clean_data`` into ``tidy_data.txt`` file.
