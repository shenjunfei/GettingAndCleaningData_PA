# 1, Load the data
xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")

features <- read.table("features.txt")
name <- as.character(features$V2)

# 2, Merges the training and the test sets to create one data set.
mydata <- rbind(xtest, xtrain)

# 3, Extracts only the measurements on the mean and standard deviation for each measurement.
ext <- ifelse(grepl("mean", name) + grepl("std", name) == 1, TRUE, FALSE)
data <- mydata[ext]

# 4, Uses descriptive activity names to name the activities in the data set
names(data) <- name[ext]

# 5, Appropriately labels the data set with descriptive variable names.
# the first element in ytrain is I5, it seems to be a typo. I set it to be 5
ytrain$V1[1] <- ytrain$V1[2]
y <- rbind(ytest, ytrain)
names(y) <- "label"
data <- cbind(data, y)

label <- read.table("activity_labels.txt")
data$label <- label[as.integer(data$label), 2]

# 6, From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
new_data <- matrix(ncol = 6, nrow = 0)
for (i in seq(1, 79)){
    new_data <- rbind(new_data, tapply(data[ ,i], data$label, mean))
}
write.table(new_data, file = "new_data.txt", row.name = FALSE)