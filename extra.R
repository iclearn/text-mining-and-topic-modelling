## supervised topic modelling using topicmodels package
library(topicmodels)
## using data AssociatedPress in topicmodels
data("AssociatedPress")

## the training subset
train <- AssociatedPress[1:100, ]
## the testing subset
test <- AssociatedPress[101:150, ]

## traiing using LDA algorithm
train.lda <- LDA(train,5)
## stroring the topics in train.topics
(train.topics <- topics(train.lda))

## test.topics include topics as discovered using the training set
test.topics <- posterior(train.lda,test)

