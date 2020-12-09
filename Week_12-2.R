# 12-2����

# �����͸� �Ʒ����հ� �׽�Ʈ������ ������ ����

n = nrow(iris) # ���� ����
i = 1:n 
train_list = sample(i, n*0.6) # 60%�� �����ϰ� ���ø�
test_list = setdiff(i, train_list) # ������(40%)
iris_train = iris[train_list, ] # �Ʒ� ���� ����
iris_test=iris[test_list, ] # �׽�Ʈ ���� ����

f = randomForest(Species~., data = iris_train) # �Ʒ� �������� ���� ������Ʈ �н�
p = predict(f, newdata=iris_test)
p

iris_test$Species

# caret - �Ʒ� ���հ� �׽�Ʈ ���� ����, train�Լ�, ���� ���� 
## ���̺귯�� �̿�

library(caret)
tarin_list = createDataPartition(y = iris$Species, p = 0.6, list = FALSE)
iris_train = iris[train_list, ]
iris_test = iris[-train_list, ]
f = randomForest(Species~., data = iris_train)
p = predict(f, newdata = iris_test)
p

# ���� ����

control = trainControl(method = 'cv', number = 5) # 5�� ���� ����
f = train(Species~., data = iris, method = 'rf', metric = 'Accuracy', trControl = control)
confusionMatrix(f)