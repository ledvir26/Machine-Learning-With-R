library(nnet)
library(caret)
install.packages("devtools")
library(devtools)

bh <- read.csv("../data/tema4/BostonHousing.csv")

set.seed(2018)
t.id <- createDataPartition(bh$MEDV, p = 0.7, list = F)
summary(bh$MEDV)

fit <- nnet(MEDV/50 ~., data = bh[t.id, ],
            size=6, decay=0.1,
            maxit=1000, linout=T)

install_github('fawda123/NeuralNetTools', ref = 'development')
install.packages('NeuralNetTools')
library(NeuralNetTools)
plotnet( fit, max.sp = T)