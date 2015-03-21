## CodeBook for "Getting and Cleanin Data Project" ##

## Data Sources ##

The data was obtained from this website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project was obtained from this zip file:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## run_analysis.R script ##

"run_analysis.R" - this r script cleans the data by performing these tasks:

1 - loads 'plyr' package  for use in Step 5 (see points 12 and 13 below) 


## step 1 ##
2 - reads the "x_test.txt", "y_test.txt" and "subject_test.txt" files and stores each in the variables  'testLabel', 'testData' and 'testSubject'

3 -. reads the x_train.txt, y_train.txt and subject_train.txt files and stores each in the variables  'trainingLabel', 'trainingData', and 'trainingSubject'. 

4 - Data frame concatenation. The script concatenates 'testData to 'trainingData' - this generates 'joinData' a data frame of 10299 x 561. The script concatenates' testLabel' to trainingLabel - this generates joinLabel a data frame of 10299 x 1. The script concatenates 'testSubject' to trainingSubject - this generates 'joinSubject' a data frame of 10299 x 1.


## Step 2  ##
5 - "features.txt" file. Read this file and store the data in variable named 'feature'. Extract from this the mean and standard deviation measurement. 

6 - For the subset (created in step 5) the column names are cleaned:
6(a) - the symbol () is removed
6(b) - the word "mean" is capitalized
6(c) - the abbreviation "freq" is replace by the unabbreviated term - "Frequency"
6(d) - the term "std" is capitalized
6(e) - the abbreviation "Mag" is replace by the unabbreviated term - "Magnitude"
6(f) - the symbol "-" is removed
6(g) - the abbreviation "Acc" is replace by the unabbreviated term - "Acceleration"


## Step 3  ##
7 - Activity names. The "activity_labels.txt" file is read and the data is stored in the 'active' variable.

8 - The activity names - found in the second column of active are cleaned. All names are made lowercase; Underscores are also removed and the letter after the removed is capitalised.

9 - 'joinLabel' values are transformed.


##Step 4  ##
10 - A cleaned data frame is created by the combination of 'joindata', 'joinLabel' and 'joinSubject'. This new data frame is called 'cleanData'. The column names "subject" and "activity" are used for clarity. 

11 - The 'cleanData' data frame is written to the file "merged_data.txt" in the working directory.


## Step 5  ##
12 - A second, independent tidy data set is generated - this contains the average of each variable for each activity and each subject. As there are 6 activities and 30 subjects this gives 180 combinations. Using ddplyr the mean is calculated and placed in to 'mean_variable' data frame.  

13 - 'mean_variable' data frame is written to the file "tidy_data_with_means.txt". 
