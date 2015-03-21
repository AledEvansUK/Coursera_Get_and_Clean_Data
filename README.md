# Coursera_Get_and_Clean_Data
Repo for 'getting and cleaning data' module for Coursera Data Science course

For using the "run_analysis.R" script:

1 - Access the data at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2 - Unzip the file and save in a folder 'project-data'. This folder should be in the working directory and the "run_analysis.R" should also be run from the working directory.

3 - Output files from running "run_analysis.R" are found in the working directory.
- "tidy_data_with_means.txt" containing the final data frame from step 5 in the project.
- "merged_data.txt" containing the data frame 'cleanData'.


4 - To read the output file use the r code:

mean_variable <- read.table("./tidy_data_with_means.txt", header = TRUE)
View(mean_variable)

Hope this is all accessible and works for you!

(c) Aled Evans 2015



