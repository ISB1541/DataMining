# 12-2주차

# 데이터를 훈련집합과 테스트집합을 나누어 적용

n = nrow(iris) # 샘플 개수
i = 1:n 
train_list = sample(i, n*0.6) # 60%를 랜덤하게 샘플링
test_list = setdiff(i, train_list) # 나머지(40%)
iris_train = iris[train_list, ] # 훈련 집합 추출
iris_test=iris[test_list, ] # 테스트 집합 추출

f = randomForest(Species~., data = iris_train) # 훈련 집합으로 랜덤 포레스트 학습
p = predict(f, newdata=iris_test)
p

iris_test$Species

# caret - 훈련 집합과 테스트 집합 분할, train함수, 교차 검증 
## 라이브러리 이용

library(caret)
tarin_list = createDataPartition(y = iris$Species, p = 0.6, list = FALSE)
iris_train = iris[train_list, ]
iris_test = iris[-train_list, ]
f = randomForest(Species~., data = iris_train)
p = predict(f, newdata = iris_test)
p

# 교차 검증

control = trainControl(method = 'cv', number = 5) # 5겹 교차 검증
f = train(Species~., data = iris, method = 'rf', metric = 'Accuracy', trControl = control)
confusionMatrix(f)
