# Getting and Cleaning Data - Course Project
# RScript: Tiago, 25 February 2023

#loading packages
library(dplyr) #for using summarize

# Uses the UCI HAR Dataset; assumes that it has been unzipped
# inside the working directory retaining the directory tree

# Step 1: Merge training and test datasets

#reading the data
#featureas data
feat <- read.table("UCI HAR Dataset/features.txt", col.names = c("f","feat")) #dim(561, 2)

#activities data
activit<- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("yvalue", "activit")) #dim(6, 2)

#Training data (x, y)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feat$feat) #dim(7352, 561)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "yvalue") #dim(7352, 1)

#Testing data (x, y)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feat$feat) #dim(2947, 561)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "yvalue") #dim(2947, 1)

#Subject data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject") #dim(7352, 1)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject") #dim(2947, 1)

#Merging data
X <- rbind(x_train, x_test) #dim(10299, 561)
Y <- rbind(y_train, y_test) #dim(10299, 1)
Subject <- rbind(subject_train, subject_test) #dim(10299, 1)

#total data
total_data <- cbind(Subject, Y, X) #dim(10299, 563)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

#clean data
Measure_data <- total_data %>% select(subject, yvalue, contains("mean"), contains("std")) #dim(10299, 88)

# Step 3: Uses descriptive activity names to name the activities in the data set.

#describing activities
Measure_data$yvalue <- activit[Measure_data$yvalue, 2]

# Step 4: Appropriately labels the data set with descriptive activity names.

#label the dataset
names(Measure_data)[2] <- "activity"
names(Measure_data)<-gsub("^t", "Time", names(Measure_data))
names(Measure_data)<-gsub("^f", "Frequency", names(Measure_data))
names(Measure_data)<-gsub("Acc", "Accelerometer", names(Measure_data))
names(Measure_data)<-gsub("BodyBody", "Body", names(Measure_data))
names(Measure_data)<-gsub("Mag", "Magnitude", names(Measure_data))
names(Measure_data)<-gsub("tBody", "TimeBody", names(Measure_data))
names(Measure_data)<-gsub("-mean()", "Mean", names(Measure_data), ignore.case = TRUE)
names(Measure_data)<-gsub("-std()", "Standard deviation", names(Measure_data), ignore.case = TRUE)
names(Measure_data)<-gsub("-freq()", "Frequency", names(Measure_data), ignore.case = TRUE)
names(Measure_data)<-gsub("angle", "Angle", names(Measure_data))
names(Measure_data)<-gsub("gravity", "Gravity", names(Measure_data))
names(Measure_data)<-gsub("Gyro", "Gyroscope", names(Measure_data))

# Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#new data with group subject and activity
Clean_data <- Measure_data %>% group_by(subject, activity) %>% #dim(180, 88)
                               summarize_all(funs(mean))

#write new table with our clean data
write.table(Clean_data, "tidy_data.txt", row.names = F, col.names= T, sep = "\t")

#end of R script