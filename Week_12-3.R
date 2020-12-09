# 12-3����

# ���� ����
## 1) ���� ���� �����ϰ� ������ ��ȣ ��
## 2) ���� �𵨾ȿ����� ������ ������ �Ű����� ����

# �õ�
## 1) ������ �Ű������� �⺻���� �� ����
## 2) ������ �Ű����� ����ȭ�� �� ������ ���ÿ� ����

# �õ�1

## iris �����Ϳ� ���� 5�� ���� ������ 4�� �𵨿� ���� �� ��
control = trainControl(method = 'cv', number = 5)
r = train(Species~., data = iris, method = 'rpart', metric = 'Accuracy', trControl = control)
f = train(Species~., data = iris, method = 'rf', metric = 'Acciracy', trControl = control)
s = train(Species~., data = iris, method = 'svmRadial', metric = 'Accuracy', trControl = control)
k = train(Species~., data = iris, method = 'knn', metric = 'Accuracy', trControl = control)
resamp = resamples(list(����Ʈ�� = r, ����������Ʈ = f, SVM = s, KNN = k))
summary(resamp)

sort(resamp, decreasing = TRUE)

## �ð�ȭ
dotplot(resamp)


# �õ�2

control = trainControl(method = 'cv', number = 10)
r = train(Species~., data = iris, method = 'rpart', metric = 'Accuracy', trControl = control)
f10 = train(Species~., data = iris, method = 'rf', ntree = 10, metric = 'Acciracy', trControl = control)
f100 = train(Species~., data = iris, method = 'rf', ntree = 100, metric = 'Acciracy', trControl = control)
f300 = train(Species~., data = iris, method = 'rf', ntree = 300, metric = 'Acciracy', trControl = control)
s_Radial = train(Species~., data = iris, method = 'svmRadial', metric = 'Accuracy', trControl = control)
s_Polynomial = train(Species~., data = iris, method = 'svmPoly', metric = 'Accuracy', trControl = control)
k = train(Species~., data = iris, method = 'knn', metric = 'Accuracy', trControl = control)

resamp = resamples(list(����Ʈ�� = r, ��������10 = f10, ��������100 = f100, 
                            ��������300 = f300, SVMRadial = s_Radial, SVMPolynomial = s_Polynomial,
                            KNN = k))
summary(resamp)

sort(resamp, decreasing = TRUE)

dotplot(resamp)