# Final Exam - Datamining
# 20141689 김호빈

# Call libarary
library(scatterplot3d)
library(rpart)
library(randomForest)
library(class)
library(e1071)

# 1. 다음 학습데이터로 선형모델을 만들고, 테스트데이터로 예측을 수행하세요

# 학습데이터
x=c(3.0, 6.0, 3.0, 6.0, 7.5, 7.5, 15.0)
u=c(10.0, 10.0, 20.0, 20.0, 5.0, 10.0, 12.0)
y=c(4.56, 5.9, 6.7, 8.02, 7.7, 8.1, 6.1)

# 회귀모델
m=lm(y ~ x + u)
m

# 실제값 적용
nx=c(7.5, 5.0)
nu=c(15.0, 12.0)
new_data=data.frame(x=nx, u=nu)
ny=predict(m, new_data)
ny

s=scatterplot3d(nx, nu, ny, xlim=0:20, ylim=0:25, zlim=0:10, pch=20, 
                  type='h', color="red", angle=60)
s$plane3d(m)

# 5. ucla 데이터에 여러가지 분류모델을 적용하고 예측하세요.

# 5-(1)
## UCLA admission 데이터 불러오기
ucla=read.csv('https://stats.idre.ucla.edu/stat/data/binary.csv')
str(ucla)
ucla$admit=factor(ucla$admit)

## 샘플링
n=nrow(ucla) # 샘플 개수
i=1:n 
train_list=sample(i, n*0.6) # 60%를 랜덤하게 샘플링
test_list=setdiff(i, train_list) # 나머지(40%)
ucla_train=ucla[train_list, ] # 훈련집합 추출
ucla_test=ucla[test_list, ] # 테스트집합 추출

# 5-(3)
## Dession Tree
r=rpart(admit~., data=ucla_train)

## randomForest 적용
f50=randomForest(admit~., ntree=50, data=ucla_train)

f1000=randomForest(admit~., ntree=1000, data=ucla_train)

## k-NN 적용
k=knn(ucla_train, ucla_test, ucla_train$admit, k=9)
table(ucla_test$admit, k)
# conf_mat=table(predict(k, newdata = ucla_test), ucla_train$admit)

## SVM 적용(cost=1)
sR=svm(admit~., data=ucla_train, cost=1) # 기본 커널 - radial basis

sP=svm(admit~., data=ucla_train, cost=1, kernel='polynomial')

model_names = c("r", "f50", "f1000", "k", "sR", "sP")
models = list(r, f50, f1000, k, sR, sP)
index = 1
for(i in models) {
  if(index == 4) {
    conf_mat = table(ucla_test$admit, i)
  }
  else {
    pre = predict(i, newdata = ucla_test, type = 'class')
    conf_mat = table(pre, ucla_test$admit)
  }
  print(paste("model : ", model_names[index], sep =""))
  print(conf_mat)
  cat('\n')
  index = index + 1
  
  print(paste("Accuracy : ", (conf_mat[1][1] + conf_mat[1][2]) / nrow(ucla_test), sep = ""))
}
nrow(ucla_test)
