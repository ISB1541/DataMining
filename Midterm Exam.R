# 1. airquality 데이터를 살펴보자.
## A. airquality 데이터에서 바람이 가장 세게 분 날짜(월, 일)를 출력하시오
str(airquality) # airqulality 데이터의 정보 추출 
max(airquality$Wind) # airquality$Wind의 최댓값 추출
airquality[max(airquality$Wind), c("Month", "Day")] # airquality의 데이터에서 바람의 세기가 가장 센 날을 찾아 월, 일을 추출

## B. airquality 데이터에는 총 몇 개의 결측값이 포함되어 있는지 출력하시오
str(airquality) # airqulality 데이터의 정보 추출
is.na(airquality) # 결측값 NA인 데이터가 있으면 T, 없으면 F 반환
sum(is.na(airquality)) # sum 함수로 결측값 개수 계산산

# 2. 1부터 100까지의 수 중에서 3의 배수이면서 4의 배수는 아닌 수의 합을 구하시오
num=1 #count
sum=0 #합 

for(num in 1:100) { # 1부터 100까지 반복
  if((num %% 3 == 0) & (num %% 4 != 0)){ # num은 나머지가 3이고, 4는 아닌 수
    print(num) 
    sum = sum + num # 합
  }
  num = num+1 #숫자 증가
}
print(sum)

# 3. hflights 라이브러리를 설치하고 부착하여, hflights 데이터를 활용하시오
install.packages("hflights") # 라이브러리 설치
library(hflights) # 라이브러리 부착

## A. hflights 데이터에서 비행시간이 가장 긴 데이터는 몇 시간 몇 분인지 표현하시오

head(hflights) # hflights 정보 추출

help(hflights) # AirTime: flight time, in minutes

# 결측값을 제거한 최대 비행시간
maxFilghtTime = max(na.omit(hflights$AirTime)) 
print(maxFilghtTime)

# 분 단위이므로 시간 환산
hour = maxFilghtTime %/% 60 
min = maxFilghtTime %% 60

print(paste("가장 긴 비행 시간 :", hour, "시간", min, "분"))

## B. hflights 데이터에서 비행거리가 가장 긴 데이터는 몇 마일인지 출력하시오
hflights$Distance # Distance: distance of flight, in miles
longestFlightDistance = max(na.omit(hflights$Distance))
print(paste("가장 긴 비행거리 :",longestFlightDistance, "마일"))

## C. hflights 데이터에서 비행편이 취소된 건수는 총 몇 건인지 출력하시오
cancelCount = sum(hflights$Cancelled) # Cancelled: cancelled indicator: 1 = Yes, 0 = No
print(paste("취소 건수 :", cancelCount))

# 4.본인이 가공하고자 하는 데이터를 선택하여 읽어온 후, 다음 옵션들 중 7가지 이상 적용하시오.
# 결측값과 이상값이 존재하지않아, 몇 개의 데이터를 이상값과 결측값으로 수정했습니다.
library(dplyr)

filter()
badminRank = read.csv("E:/Rstudio/dataMining/men_doubles.csv") # 세계 배드민턴 남자 복식 기준 랭킹 데이터

# 옵션1, 옵션2
badminRank$RANK # 랭크 확인,
badminRank$RANK=ifelse((badminRank$RANK=="A" | badminRank$RANK == "C"), NA, badminRank$RANK)# 랭크에 숫자가 아닌 알파벳을 결측값으로 처리
badminRank$RANK # 이상값 처리 확인
table(is.na(badminRank)) # 결측값 확인
badminRankT = na.omit(badminRank) # 결측값 제거
table(is.na(badminRankT)) # 결측값 제거 확인


# 옵션3
sample(badminRankT,2) # 랜덤으로 2개 속성 샘플 추출
filter(badminRankT, COUNTRY=="KOR") # 한국 선수 정보 추출

# 옵션4
names(badminRankT)

summarize(badminRankT, countryWinRate=mean(WINRATE)) # 1~100위권 선수 평균 승률

# 옵션5
group_by(badminRankT, RANK, COUNTRY)

# 옵션6
badminRankT %>% group_by(RANK, COUNTRY)

# 옵션7
badminRankT %>% group_by(RANK, COUNTRY) %>% arrange(desc(WINRATE)) # 승률이 높은 순으로 정렬

# 옵션9
train_set = sample_frac(badminRankT, 0.9)
str(train_set)
