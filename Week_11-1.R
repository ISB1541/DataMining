# 11����

library(rpart)
library(randomForest)

f = randomForest(Species~., data=iris)
f
plot(f)

varUsed(f)

varImpPlot(f)

treesize(f)

# ���ο� ������ ����
newd = data.frame(Sepal.Length = c(7.01, 5.11, 6.32), Sepal.Width = c(3.2, 3.51, 3.31), 
                  Petal.Length = c(4.71, 1.4, 6.02), Petal.Width = c(1.4, 0.19, 2.49))

predict(f, newdata=newd)

## Ȯ�� ���
predict(f, newdata=newd, type='prob')

## ��ǥ�� Ȯ��
predict(f, newdata=newd, type='vote', norm.votes=FALSE)

# ������ �Ű����� : ���� ������ �н� ����� �����ϴµ� ����ϴ� ����
## ���� 
## 1) ntree : ����Ʈ���� ����
## 2) nodesize : ���� ��忡 ������ ������ �ּ� ���� (ũ�� �����Ҽ��� ���� ���� Ʈ��)
## 3) maxdoes : ���� ����� �ִ� ����
small_forest=randomForest(Species~., data=iris, ntree=20, nodesize=6, maxnodes=12)
treesize(small_forest)

small_forest