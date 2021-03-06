## 9-3����

#���߼���ȸ�� - Ư¡�� 2�� �̻��� ȸ��


## �ǽ�
install.packages("scatterplot3d")
library(scatterplot3d)
x = c(3.0, 6.0, 3.0, 6.0)
u = c(10.0, 10.0, 20.0, 20.0)
y = c(4.65, 5.9, 6.7, 8.02)
scatterplot3d(x, u, y, xlim=2:7, ylim = 7:23, zlim = 0:10, pch = 20, type = 'h')

### ���߼���ȸ�� ����
m = lm(y ~ x + u)
coef(m)
s = scatterplot3d(x, u, y, xlim=2:7, ylim = 7:23, zlim = 0:10, pch = 20, type = 'h')
s$plane3d(m) # ��հ�
fitted(m)
residuals(m)
deviance(m) # ���� ������
deviance(m) / length(x) # ��� ���� ����

### ������ ����
nx = c(7.5, 5.0)
nu = c(15.0, 12.0)
new_data = data.frame(x = nx, u = nu)
ny = predict(m, new_data)
ny 
  
s = scatterplot3d(nx, nu, ny, xlim = 0:10, ylim = 7:23, zlim = 0:10, pch = 20, 
                  type = 'h', color = "red", angle = 60)
s$plane3d(m)

## Trees �ǽ�(1)
str(trees)
summary(tress)
scatterplot3d(trees$Girth, trees$Height, trees$Volume)
m = lm(Volume ~ Girth + Height, data = trees)
m
s = scatterplot3d(trees$Girth, trees$Height, trees$Volume, pch = 20, type = 'h', angle = 55)
s$plane3d(m)

ndata = data.frame(Girth = c(8.5, 13.0, 19.0), Height = c(72, 86, 85))
predict(m, newdata = ndata)

## ����
### Ʈ���̴׼� 
x = c(3.0, 6.0, 3.0, 6.0, 7.7)
u = c(10.0, 10.0, 20.0, 20.0, 14.8)
y = c(4.65, 5.9, 6.7, 8.02, 7.7)

### ȸ�͸�
m = lm(y ~ x + u)
m

### ������ ����
nx = c(7.5, 5.0)
nu = c(15.0, 12.0)
new_data = data.frame(x = nu, u = nu)
ny = predict(m, new_data)

s = scatterplot3d(nx, nu, ny, xlim = 0:10, ylim = 7:23, zlim = 0:10, pch = 20, 
                  type = 'h', color = "red", angle = 60)
s$plane3d(m)