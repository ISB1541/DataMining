# 12-3주차

# 모델을 선택
## 1) 여러 모델을 적용하고 성능을 상호 비교
## 2) 같은 모델안에서도 최적의 하이퍼 매개변수 설정

# 시도
## 1) 하이퍼 매개변수를 기본으로 모델 선택
## 2) 하이퍼 매개변수 최적화와 모델 선택을 동시에 수행

# 시도1

## iris 데이터에 대한 5겹 교차 검증을 4개 모델에 적용 및 비교
control = trainControl(method = 'cv', number = 5)
r = train(Species~., data = iris, method = 'rpart', metric = 'Accuracy', trControl = control)
f = train(Species~., data = iris, method = 'rf', metric = 'Acciracy', trControl = control)
s = train(Species~., data = iris, method = 'svmRadial', metric = 'Accuracy', trControl = control)
k = train(Species~., data = iris, method = 'knn', metric = 'Accuracy', trControl = control)
resamp = resamples(list(결정트리 = r, 랜덤포리스트 = f, SVM = s, KNN = k))
summary(resamp)

sort(resamp, decreasing = TRUE)

## 시각화
dotplot(resamp)


# 시도2

control = trainControl(method = 'cv', number = 10)
r = train(Species~., data = iris, method = 'rpart', metric = 'Accuracy', trControl = control)
f10 = train(Species~., data = iris, method = 'rf', ntree = 10, metric = 'Acciracy', trControl = control)
f100 = train(Species~., data = iris, method = 'rf', ntree = 100, metric = 'Acciracy', trControl = control)
f300 = train(Species~., data = iris, method = 'rf', ntree = 300, metric = 'Acciracy', trControl = control)
s_Radial = train(Species~., data = iris, method = 'svmRadial', metric = 'Accuracy', trControl = control)
s_Polynomial = train(Species~., data = iris, method = 'svmPoly', metric = 'Accuracy', trControl = control)
k = train(Species~., data = iris, method = 'knn', metric = 'Accuracy', trControl = control)

resamp = resamples(list(결정트리 = r, 랜덤포레10 = f10, 렌덤포레100 = f100, 
                            랜덤포레300 = f300, SVMRadial = s_Radial, SVMPolynomial = s_Polynomial,
                            KNN = k))
summary(resamp)

sort(resamp, decreasing = TRUE)

dotplot(resamp)
