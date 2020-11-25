# 11-2주차

# SVM : 여백을 최대로 하는 최적 모델을 찾아줌

# 커널 트릭(kernel trick) : 저차원에서 선형 모델로 분류안되는 것을 고차원으로 가져와서 분류하는 방법
## 종류 : polynomial, raidal basis, sigmoid
## ex) 2 -> 3차원

# install.packages("e1071")
library(e1071)
s=svm(Species~., data=iris) # 기본 커널은 radial basis 사용
print(s)

table(predict(s, iris), iris$Species) # error 4/150 -> 2.67%

# 옵션 변경
s = svm(Species~., data=iris, kernel='polynomial') # 커널 사용
p = predict(s, iris)
table(p, iris$Species)

# svm의 하이퍼 매개변수 (C)

s = svm(Species~., data=iris, cost=100) # cost 100 설정

# 훈련집합에 대한 에러 확인 
## c가 작아질 수록 훈련집합에 대한 에러율은 줄어들지만 새로운 데이터에 대한 에러율은 높아진다.
## 적절한 c의 설정이 중요하다.

p = predict(s, iris)
table(p, iris$Species)

# K-NN (K-Nearest Neighbor) : 새로운 테스트 샘픙이 입력되면 가장 가까운 k개의 훈련집합 샘플을 찾고 발생 빈도가 가장 높은 부류로 설정
# 훈련집합의 모든 샘플의 거리 정보를 메모리에 저장해두어야하므로 메모리 기반

library(class)
train=iris
test=data.frame(Sepal.Length=c(5.11, 6.01, 6.32), Sepal.Width=c(3.51, 3.2, 3.31),
                Petal.Length=c(1.4, 4.71, 6.02), Petal.Width=c(0.19, 1.4, 2.49))
k=knn(train[,1:4], test, train$Species, k=5)
k

# train함수를 쓰면 여러 모델을 일관성있게 프로그래밍 가능
# install.packages("caret")
library(caret)
r=train(Species~., data=iris, method='rpart')
t=train(Species~., data=iris, method='rt')
s=train(Species~., data=iris, method='svmRadital')
k=train(Species~., data=iris, method='knn')