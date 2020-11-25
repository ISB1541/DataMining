# 10-2����

install.packages("rpart")
library(rpart)
r = rpart(Species~., data=iris)
printcp(r)

# ����Ʈ�� �ð�ȭ
par(mfcol=c(2,1), xpd=NA) # mfcol ������ ä��, xpd ����
plot(r)
text(r, use.n = TRUE)
iris

# �Ʒ����տ� ���� ����
p = predict(r, iris, type = 'class') # type �⺻ prob
table(p, iris$Species)

p = predict(r, iris)
print(p)

# ���� ������ ����
newd = data.frame(Sepal.Length = c(7.01, 5.11, 6.32), Sepal.Width = c(3.2, 3.51, 3.31), 
                  Petal.Length = c(4.71, 1.4, 6.02), Petal.Width = c(1.4, 0.19, 2.49))
print(newd)
predict(r, newdata = newd) # Ȯ��
predict(r, newdata = newd, type = 'class') # Ŭ����