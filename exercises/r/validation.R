# R program to implement
# validation set approach
# Taken from https://www.geeksforgeeks.org/cross-validation-in-r-programming/
library(tidyverse)
library(caret)
library(datarium)

# setting seed to generate a
# reproducible random sampling
set.seed(123)

# creating training data as 80% of the dataset
random_sample <- createDataPartition(marketing $ sales, p = 0.8, list = FALSE)

# generating training dataset
# from the random_sample
training_dataset <- marketing[random_sample, ]

# generating testing dataset
# from rows which are not
# included in random_sample
testing_dataset <- marketing[-random_sample, ]

# Building the model

# training the model by assigning sales column
# as target variable and rest other columns
# as independent variables
model <- lm(sales ~., data = training_dataset)

# predicting the target variable
predictions <- predict(model, testing_dataset)

# computing model performance metrics
data.frame( R2 = R2(predictions, testing_dataset $ sales), RMSE = RMSE(predictions, testing_dataset $ sales), MAE = MAE(predictions, testing_dataset $ sales))
