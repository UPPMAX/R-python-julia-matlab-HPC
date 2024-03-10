# Simple example taken from https://machinelearningmastery.com/machine-learning-in-r-step-by-step/
library(caret)

# COMMENT OUT THIS SECTION IF YOU CANNOT ACCESS REMOTE DATA-SETS
# --------------------------------------------------------------
# attach the iris dataset to the environment
data(iris)
# rename the dataset
dataset <- iris
# ---------------------------------------------------------------

# REMOVE THE COMMENTS ON THIS SECTION (except comments...) TO USE LOCAL DATA-SETS
# ------------------------------------------------------------------------------
# define the filename
#filename <- "iris.csv"
# load the CSV file from the local directory
#dataset <- read.csv(filename, header=FALSE)
# ------------------------------------------------------------------------------

# set the column names in the dataset
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

# create a list of 80% of the rows in the original dataset we can use for training
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
# select 20% of the data for validation
validation <- dataset[-validation_index,]
# use the remaining 80% of data to training and testing the models
dataset <- dataset[validation_index,]

# Run algorithms using 10-fold cross validation
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# a) linear algorithms
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)
# b) nonlinear algorithms
# CART
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)
# kNN
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)
# c) advanced algorithms
# SVM
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)

# summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)

# summarize Best Model
print(fit.lda)

# estimate skill of LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)
