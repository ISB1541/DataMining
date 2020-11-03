# 7-1����

# ������ �ð�ȭ
## ex) �ؽ��� ������
anscombe # data 1 ~ 4�� �����ϴ� ������ ������ ���, �л�, �׸��� x, y���� ������谡 ��� ����

apply(anscombe, 2, mean) # ���
apply(anscombe, 2, var) # �л�
cor(anscombe$x1, anscombe$y1) #������� 
cor(anscombe$x2, anscombe$y2)
cor(anscombe$x3, anscombe$y3)
cor(anscombe$x4, anscombe$y4) 

### �û���
#### ��� ��ǥ�� �м� ��ġ������ ���ϸ�, 4���� ������ ���� ���� �����ϴٰ� �� �� ����
#### �׷��� �׷����� ���� ���� �ٸ� ������ ���� ���������� �� �� �ִ�.
#### �� ������ ���� Ȯ���ϴ� ���� �߿��ϸ�, ������ �߸� ���޵� ���ɼ��� �������� ������ ������ �ŷڼ��� �����Ѵ�.

library(gapminder)
library(dplyr)
y <- gapminder %>% group_by(year, continent) %>% summarize(c_pop=sum(pop)) # �α� ��ȭ�� ���̴� ����� ������ �� ȿ����
head(y, 20)

### �ð�ȭ
plot(y$year, y$c_pop)
plot(y$year, y$c_pop, col=y$continent, pch=c(1:5))
legend("topleft", legend = levels(y$continent), col=y$continent, pch=c(1:5)) # ��