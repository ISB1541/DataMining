# 11-2����

# SVM : ������ �ִ�� �ϴ� ���� ���� ã����

# Ŀ�� Ʈ��(kernel trick) : ���������� ���� �𵨷� �з��ȵǴ� ���� ���������� �����ͼ� �з��ϴ� ���
## ���� : polynomial, raidal basis, sigmoid
## ex) 2 -> 3����

# install.packages("e1071")
library(e1071)
s=svm(Species~., data=iris) # �⺻ Ŀ���� radial basis ���
print(s)

table(predict(s, iris), iris$Species) # error 4/150 -> 2.67%

# �ɼ� ����
s = svm(Species~., data=iris, kernel='polynomial') # Ŀ�� ���
p = predict(s, iris)
table(p, iris$Species)

# svm�� ������ �Ű����� (C)

s = svm(Species~., data=iris, cost=100) # cost 100 ����

# �Ʒ����տ� ���� ���� Ȯ�� 
## c�� �۾��� ���� �Ʒ����տ� ���� �������� �پ������ ���ο� �����Ϳ� ���� �������� ��������.
## ������ c�� ������ �߿��ϴ�.

p = predict(s, iris)
table(p, iris$Species)

# K-NN (K-Nearest Neighbor) : ���ο� �׽�Ʈ ���V�� �ԷµǸ� ���� ����� k���� �Ʒ����� ������ ã�� �߻� �󵵰� ���� ���� �η��� ����
# �Ʒ������� ��� ������ �Ÿ� ������ �޸𸮿� �����صξ���ϹǷ� �޸� ���

library(class)
train=iris
test=data.frame(Sepal.Length=c(5.11, 6.01, 6.32), Sepal.Width=c(3.51, 3.2, 3.31),
                Petal.Length=c(1.4, 4.71, 6.02), Petal.Width=c(0.19, 1.4, 2.49))
k=knn(train[,1:4], test, train$Species, k=5)
k

# train�Լ��� ���� ���� ���� �ϰ����ְ� ���α׷��� ����
# install.packages("caret")
library(caret)
r=train(Species~., data=iris, method='rpart')
t=train(Species~., data=iris, method='rt')
s=train(Species~., data=iris, method='svmRadital')
k=train(Species~., data=iris, method='knn')