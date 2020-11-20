# 10-3주차

install.packages("rpart")
install.packages("randomForest")
library(rpart)

# library(rpart.plot)
# rpart.plot(r)
r = rpart(Species~., data=iris)
printcp(r)

# 결정트리의 해석
summary(r)

# 결정트리의 장점 1. 해석 가능성 2. 예측 빠름 3.앙상블 기법으로 확장 가능 -> 랜덤 포레스트

# 랜덤 포레스트
library(randomForest)
f = randomForest(Species~., data=iris)
f
plot(f)
