# 5-3����

# dplyr ���̺귯��
## ������ ������ ������ Ưȭ�� ���̺귯��
## filter Ȥ�� select ���� ����� ������ �Լ� ����, ����ڵ��� ���� ������ Ȱ�� ����

select(gapminder, country, year, lifeExp)
filter(gapminder, country=="Croatia")


## summarize, group_by �Լ�
summarize(group_by(gapminder, continent, country), pop_avg = mean(pop))

## %>% �����ڸ� Ȱ��
### �� ���ɾ �Լ��� ���, �Լ��� ù��° ���ڷ� ����!!
gapminder %>% group_by(continent, country) %>% summarize(pop_avg = mean(pop))

### %>% �߰� ��� ���� ���� ���� ���� > �ӵ� ����
