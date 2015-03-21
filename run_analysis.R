
require(plyr)
setwd("C:/Users/Aled_Debs/Documents/R/project-data")

## Step 1. Merge test and training data sets

testLabel <- read.table("./test/y_test.txt")
table(testLabel)
testData <- read.table("./test/X_test.txt")
dim(testData) # 947*561
head(testData)
testSubject <- read.table("./test/subject_test.txt")

trainingLabel <- read.table("./train/y_train.txt")
table(trainingLabel)
trainingData <- read.table("./train/X_train.txt")
dim(trainingData) # this should be 7352*561
head(trainingData)
trainingSubject <- read.table("./train/subject_train.txt")

joinData <- rbind(trainingData, testData)
dim(joinData) # this should be 10299*561
joinLabel <- rbind(trainingLabel, testLabel)
dim(joinLabel) # this should be 10299*1
joinSubject <- rbind(trainingSubject, testSubject)
dim(joinSubject) # this should be 10299*1


## Step 2. Extract standard deviation and mean measurements
feature <- read.table("./features.txt")
dim(feature) # this should be 561*2
meanStdIndice <- grep("mean\\(\\)|std\\(\\)", feature[,2])
length(meanStdIndice) 
joinData <- joinData[, meanStdIndice]
dim(joinData)  # this should be 10299*66
names(joinData) <- gsub("\\(\\)", "", feature[meanStdIndice, 2]) # Tidy by removing ()
names(joinData) <- gsub("mean", "Mean", names(joinData)) # Tidy by capitlizing 'M'
names(joinData) <- gsub("freq", "Frequency", names(joinData)) # Tidy by changing "freq" to "Frequency"
names(joinData) <- gsub("std", "Std", names(joinData))  # Tidy by capitlizing 's'
names(joinData) <- gsub("Mag", "Magnitude", names(joinData)) # Tidy by changing "Mag" to "Magnitude"
names(joinData) <- gsub("-", "", names(joinData))  # Tidy by removing "-" column naming
names(joinData) <- gsub("Acc", "Acceleration", names(joinData)) # Tidy by changing "Acc" to "Acceleration"

## Step 3. Name activities using descriptive activty names.
active <- read.table("./activity_labels.txt")
active[, 2] <- tolower(gsub("_", "", active[, 2]))

substr(active[2, 2], 8, 8) <- toupper(substr(active[2, 2], 8, 8))
substr(active[3, 2], 8, 8) <- toupper(substr(active[3, 2], 8, 8))
activeLabel <- active[joinLabel[, 1], 2]
joinLabel[, 1] <- activeLabel
names(joinLabel) <- "activity"

## Step 4. Data-set is labelled with descriptive activity names
names(joinSubject) <- "subject"
cleanData <- cbind(joinSubject, joinLabel, joinData)
dim(cleanData) # This should be 10299*68
write.table(cleanData, "merged_data.txt")

## Step 5.
## uses plyr package to get variable means 
## and save to the final data-set ""tidy_data_with_means.txt"

mean_variable <- ddply(cleanData, c("subject","activity"), numcolwise(mean))

write.table(mean_variable, file="tidy_data_with_means.txt")

## mean_variable <- read.table("./tidy_data_with_means.txt", header = TRUE)
## View(mean_variable)



