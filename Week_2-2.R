# 2-2����

# R�� ���̺귯���� Ư�� �о߸� ���� ���ߵ� R �Լ��� ��Ƶ� ����Ʈ���� (��Ű��)

# R�� ���� : ����� ���̺귯��

# CRAN ����Ʈ : R�� ��� ���̺귯�� �оߺ��� Ȯ�� ����

# install.pacakges("���̺귯���̸�") ���̺귯�� ��ġ 

# library() ����� �Լ��� ����) ���̺귯�� ��ġ(�ϵ��ũ)->���̺귯�� ����(RAM)

# search() ���� �Լ� Ȯ�� ����

# str() & head()

head(iris, 10) # 10���� ������ ���

plot(iris$Petal.Width, iris$Petal.Length, col=iris$Species) #���� �Ӽ����� ���� ����

# ���� ������ �ǽ�(Tips)

# 1. ������ ����
tips=read.csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')
str(tips)
head(tips, 10)

# summary() -�Ӽ�(��, column) ���� ��� ��� Ȯ��
summary(tips)

# dplyr() & ggplot2() - ������ �м��� ���� �ð�ȭ
library(ggplot2)
tips%>%ggplot(aes(size)) + geom_histogram() # histogram
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day)) # ������(Scatter plot)
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day, pch=sex), size=3)

#2.Ž���� ������ �м�, ȿ�� -> ���� â���� ���� ���� ���� ����

#3. �𵨸� -> ���� ����