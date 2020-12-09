# 12-1주차

# 모델의 예측 오류 발생 이유
## 1) 세상의 불확실성
## 2) 데이터의 불완전성

library(rpart)
library(randomForest)

f = randomForest(Species~., data=iris)
f

small_forest=randomForest(Species~., data=iris, ntree=1)
small_forest
small_forest=randomForest(Species~., data=iris, ntree=5)
small_forest
small_forest=randomForest(Species~., data=iris, ntree=7)
small_forest
small_forest=randomForest(Species~., data=iris, ntree=9)
small_forest
