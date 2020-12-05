# 11주차

library(rpart)
library(randomForest)

f = randomForest(Species~., data=iris)
f
plot(f)

varUsed(f)

varImpPlot(f)

treesize(f)

# 새로운 데이터 예측
newd = data.frame(Sepal.Length = c(7.01, 5.11, 6.32), Sepal.Width = c(3.2, 3.51, 3.31), 
                  Petal.Length = c(4.71, 1.4, 6.02), Petal.Width = c(1.4, 0.19, 2.49))

predict(f, newdata=newd)

## 확률 출력
predict(f, newdata=newd, type='prob')

## 득표수 확인
predict(f, newdata=newd, type='vote', norm.votes=FALSE)

# 하이퍼 매개변수 : 모델의 구조나 학습 방법을 제어하는데 사용하는 변수
## 종류 
## 1) ntree : 결정트리의 개수
## 2) nodesize : 리프 노드에 도달한 샘플의 최소 개수 (크게 설정할수록 작은 결정 트리)
## 3) maxdoes : 리프 노드의 최대 개수
small_forest=randomForest(Species~., data=iris, ntree=20, nodesize=6, maxnodes=12)
treesize(small_forest)

small_forest

# Assignment

library(rpart)
library(randomForest)
iris
f = randomForest(Species~., data=iris)
f
newd = data.frame(Sepal.Length = c(4.7, 5.31, 6.4, 5.2, 6.3), 
                  Sepal.Width = c(3.2, 5.31, 3.22, 2.71, 3.3), 
                  Petal.Length = c(1.3, 1.5, 4.5, 3.9, 6.1),
                  Petal.Width = c(0.22, 0.2, 1.5, 1.4, 2.5))

predict(f, newdata = newd)

small_forest=randomForest(Species~., data=iris, ntree=20, nodesize=6, maxnodes=12)
