# Final Exam - Datamining
# 20141689 ��ȣ��

# Call libarary
library(scatterplot3d)
library(rpart)
library(randomForest)
library(class)
library(e1071)

# 1. ���� �н������ͷ� �������� �����, �׽�Ʈ�����ͷ� ������ �����ϼ���

# �н�������
x=c(3.0, 6.0, 3.0, 6.0, 7.5, 7.5, 15.0)
u=c(10.0, 10.0, 20.0, 20.0, 5.0, 10.0, 12.0)
y=c(4.56, 5.9, 6.7, 8.02, 7.7, 8.1, 6.1)

# ȸ�͸�
m=lm(y ~ x + u)
m

# ������ ����
nx=c(7.5, 5.0)
nu=c(15.0, 12.0)
new_data=data.frame(x=nx, u=nu)
ny=predict(m, new_data)
ny

s=scatterplot3d(nx, nu, ny, xlim=0:20, ylim=0:25, zlim=0:10, pch=20, 
                  type='h', color="red", angle=60)
s$plane3d(m)

# 5. ucla �����Ϳ� �������� �з����� �����ϰ� �����ϼ���.

# 5-(1)
## UCLA admission ������ �ҷ�����
ucla=read.csv('https://stats.idre.ucla.edu/stat/data/binary.csv')
str(ucla)
ucla$admit=factor(ucla$admit)

## ���ø�
n=nrow(ucla) # ���� ����
i=1:n 
train_list=sample(i, n*0.6) # 60%�� �����ϰ� ���ø�
test_list=setdiff(i, train_list) # ������(40%)
ucla_train=ucla[train_list, ] # �Ʒ����� ����
ucla_test=ucla[test_list, ] # �׽�Ʈ���� ����

# 5-(3)
## Dession Tree
r=rpart(admit~., data=ucla_train)

## randomForest ����
f50=randomForest(admit~., ntree=50, data=ucla_train)

f1000=randomForest(admit~., ntree=1000, data=ucla_train)

## k-NN ����
k=knn(ucla_train, ucla_test, ucla_train$admit, k=9)
table(ucla_test$admit, k)
# conf_mat=table(predict(k, newdata = ucla_test), ucla_train$admit)

## SVM ����(cost=1)
sR=svm(admit~., data=ucla_train, cost=1) # �⺻ Ŀ�� - radial basis

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