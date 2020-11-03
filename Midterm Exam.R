# 1. airquality �����͸� ���캸��.
## A. airquality �����Ϳ��� �ٶ��� ���� ���� �� ��¥(��, ��)�� ����Ͻÿ�
str(airquality) # airqulality �������� ���� ���� 
max(airquality$Wind) # airquality$Wind�� �ִ� ����
airquality[max(airquality$Wind), c("Month", "Day")] # airquality�� �����Ϳ��� �ٶ��� ���Ⱑ ���� �� ���� ã�� ��, ���� ����

## B. airquality �����Ϳ��� �� �� ���� �������� ���ԵǾ� �ִ��� ����Ͻÿ�
str(airquality) # airqulality �������� ���� ����
is.na(airquality) # ������ NA�� �����Ͱ� ������ T, ������ F ��ȯ
sum(is.na(airquality)) # sum �Լ��� ������ ���� ����

# 2. 1���� 100������ �� �߿��� 3�� ����̸鼭 4�� ����� �ƴ� ���� ���� ���Ͻÿ�
num=1 #count
sum=0 #�� 

for(num in 1:100) { # 1���� 100���� �ݺ�
  if((num %% 3 == 0) & (num %% 4 != 0)){ # num�� �������� 3�̰�, 4�� �ƴ� ��
    print(num) 
    sum = sum + num # ��
  }
  num = num+1 #���� ����
}
print(sum)

# 3. hflights ���̺귯���� ��ġ�ϰ� �����Ͽ�, hflights �����͸� Ȱ���Ͻÿ�
install.packages("hflights") # ���̺귯�� ��ġ
library(hflights) # ���̺귯�� ����

## A. hflights �����Ϳ��� ����ð��� ���� �� �����ʹ� �� �ð� �� ������ ǥ���Ͻÿ�

head(hflights) # hflights ���� ����

help(hflights) # AirTime: flight time, in minutes

# �������� ������ �ִ� ����ð�
maxFilghtTime = max(na.omit(hflights$AirTime)) 
print(maxFilghtTime)

# �� �����̹Ƿ� �ð� ȯ��
hour = maxFilghtTime %/% 60 
min = maxFilghtTime %% 60

print(paste("���� �� ���� �ð� :", hour, "�ð�", min, "��"))

## B. hflights �����Ϳ��� ����Ÿ��� ���� �� �����ʹ� �� �������� ����Ͻÿ�
hflights$Distance # Distance: distance of flight, in miles
longestFlightDistance = max(na.omit(hflights$Distance))
print(paste("���� �� ����Ÿ� :",longestFlightDistance, "����"))

## C. hflights �����Ϳ��� �������� ��ҵ� �Ǽ��� �� �� ������ ����Ͻÿ�
cancelCount = sum(hflights$Cancelled) # Cancelled: cancelled indicator: 1 = Yes, 0 = No
print(paste("��� �Ǽ� :", cancelCount))

# 4.������ �����ϰ��� �ϴ� �����͸� �����Ͽ� �о�� ��, ���� �ɼǵ� �� 7���� �̻� �����Ͻÿ�.
# �������� �̻��� ���������ʾ�, �� ���� �����͸� �̻󰪰� ���������� �����߽��ϴ�.
library(dplyr)

filter()
badminRank = read.csv("E:/Rstudio/dataMining/men_doubles.csv") # ���� ������ ���� ���� ���� ��ŷ ������

# �ɼ�1, �ɼ�2
badminRank$RANK # ��ũ Ȯ��,
badminRank$RANK=ifelse((badminRank$RANK=="A" | badminRank$RANK == "C"), NA, badminRank$RANK)# ��ũ�� ���ڰ� �ƴ� ���ĺ��� ���������� ó��
badminRank$RANK # �̻� ó�� Ȯ��
table(is.na(badminRank)) # ������ Ȯ��
badminRankT = na.omit(badminRank) # ������ ����
table(is.na(badminRankT)) # ������ ���� Ȯ��


# �ɼ�3
sample(badminRankT,2) # �������� 2�� �Ӽ� ���� ����
filter(badminRankT, COUNTRY=="KOR") # �ѱ� ���� ���� ����

# �ɼ�4
names(badminRankT)

summarize(badminRankT, countryWinRate=mean(WINRATE)) # 1~100���� ���� ��� �·�

# �ɼ�5
group_by(badminRankT, RANK, COUNTRY)

# �ɼ�6
badminRankT %>% group_by(RANK, COUNTRY)

# �ɼ�7
badminRankT %>% group_by(RANK, COUNTRY) %>% arrange(desc(WINRATE)) # �·��� ���� ������ ����

# �ɼ�9
train_set = sample_frac(badminRankT, 0.9)
str(train_set)