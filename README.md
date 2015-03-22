This is an analysis of the Samsung data.

First, I loaded the data into my work space. The datasets loaded include the training set of X (named as xtest), training set of y (named as ytest), testing set of X (named as xtest), testing set of y (named as ytest).
I also loaded the features, that is the descriptive names of the variables. Since they are originally formatted as factors, I converted them to characters and store them in the variable called name.

Second, I combine the training set and testing set by the row, so they are merged.

Third, the function grepl() is used to detect if the variable names contain the word "mean" or "std". In this way, I can extract the measurements on the mean and standard deviation for each measurement.

Fourth, I add the names of the variables to the extracted data.

Fifth, I add a column of label to the data frame. 
The first element in the training set of y is I5, which seems to be a typo. I set it to be 5.
Concatenate the testing set of y and training set of y, add it as a column of the variable called "label" to the previous data frame.
The label variable contains the values of labels and the descriptive name of each label. By substituting the descriptive names for numeric factors of label, it becomes more understandable.
There are 6 labels altogether, each standing for a kind of body status: laying, sitting, standing, walking, walking downstairs and walking upstairs.


Last but not least, I used the taaply function to calculate the mean of each variable for each feature. 
To be explicit, each column is s variable standing for a status: laying, sitting, standing, walking, walking downstairs or walking upstairs. Each row is an observation, that is the mean of mean or standard deviation of some certain measure. You can see these variables and observations in my tidy data set.
