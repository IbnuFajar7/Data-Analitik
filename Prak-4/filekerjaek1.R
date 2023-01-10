install.packages("ggpubr")
library(ggplot2)
library(olsrr)
library(car)
library(lmtest)
library(ggpubr)
library(RMySQL)
con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'houseprices', host = 'localhost')
myQuery <- "select * from houseprices_1;"
df <- dbGetQuery(con, myQuery)
View(df)
relasi = lm(df$Price ~ df$SqFt)
relasi
library(RMySQL)
con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'houseprices', host = 'localhost')
myQuery <- "select * from market_1;"
DirectMarketing <- dbGetQuery(con, myQuery)
View(DirectMarketing)
regresi = lm (DirectMarketing$AmountSpent ~ DirectMarketing$Salary)
regresi
summary(regresi)

data(mtcars)                              #memanggil data mtcars
View(mtcars)                              #melihat data mtcars
plot(mpg ~ wt, data=mtcars)  #plotregrsi
model <- lm(mpg ~ wt, data=mtcars) #membuat model regresi
abline(model) 
summary(model) 
predict(model, newdata=data.frame(wt=6))
ggscatter(mtcars, x = "mpg", y = "wt", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson")

data("mtcars")
model=lm(mpg ~ am + wt + hp, data = mtcars)
summary(model)
hist(mtcars$am)
plot(mpg~am,data=mtcars)
dataku=mtcars[,c(1,4,6,9)]
cor(dataku,method = "pearson")
ols_correlations(model)

#########contoh
latihan=read.delim("clipboard")                              #memanggil data mtcars
View(latihan)                              #melihat data mtcars
plot(No ~ LamaKursus+ TryOut+NilaiUjian, data=latihan)  #plotregrsi
model <- lm(No ~ LamaKursus+ TryOut+NilaiUjian, data=latihan) #membuat model regresi
abline(model) 
summary(model) 
predict(model, newdata=data.frame(wt=6))
ggscatter(latihan, x = "LamaKursus", y = "TryOut", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson")
