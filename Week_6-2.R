# 6-2����

# Wine ������ �ǽ�
wine=read.table("E:/Rstudio/dataMining/wine.data.txt", header=FALSE, sep=",")
head(wine)

## �Ӽ��� �ҷ�����
col_name = readLines("E:/Rstudio/dataMining/wine_name.txt")
col_name

## �Ӽ��� �����ϱ�
names(wine)[2:14] <- substr(col_name, 4, nchar(col_name)) #���ڿ� �Ϻ� ����
names(wine)

## Ʈ���̴� �� �����
library(dplyr)
train_set = sample_frac(wine, 0.6) # 60%�� ���ø�
str(train_set)