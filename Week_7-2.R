# 7-2����

# �ð�ȭ�� �����͸�  �ùٸ��� �ؼ��� �� �ְ� ���ܰ� ���ÿ�, ���� ���� �����͸� ȿ�������� ������ �� �ְ� ���ִ� ����
## ������ ���� �� �ִ�.
## �ٽ��� ��Ȯ�ϰ� �����Ҽ� �ִ�.
## ������� ����� �̻󰪵� �߰��� �� �ִ�.
## �����Ϳ��� ������ ���� ã�Ƴ� �� �ִ�.

## �������� �ð�ȭ�� �ݺ�������, ���� �������� �õ��Ǿ�� ��.
### ��/����
### ��ȭ�߼�
### ���� Ȥ�� ����
### �������

## plot() �Լ�
head(cars)
plot(cars, type="p", main="cars") #plot(�����ͼ�, ����,  �׷��� ����)
plot(cars, type="l", main="cars")
plot(cars, type="b", main="cars")

## pie, barplot �Լ�
x = gapminder %>% filter(year == 1952 & continent == "Asia") %>% 
  mutate(gdp = gdpPercap*pop) %>% select(country, gdp) %>% arrange(desc(gdp)) %>% 
  head() # mutate ���� �߰� gdp��� �� (gdp = 1�δ� �� ���귮 x �α�) �߰�

pie(x$gdp, x$country)
barplot(x$gdp, names.arg = x$country)