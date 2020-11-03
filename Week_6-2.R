# 6-2주차

# Wine 데이터 실습
wine=read.table("E:/Rstudio/dataMining/wine.data.txt", header=FALSE, sep=",")
head(wine)

## 속성명 불러오기
col_name = readLines("E:/Rstudio/dataMining/wine_name.txt")
col_name

## 속성명 지정하기
names(wine)[2:14] <- substr(col_name, 4, nchar(col_name)) #문자열 일부 추출
names(wine)

## 트레이닝 셋 만들기
library(dplyr)
train_set = sample_frac(wine, 0.6) # 60%로 샘플링
str(train_set)
