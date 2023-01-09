data()
View(Titanic)
cross <- xtabs(Freq ~ Class+Sex, data=Titanic)
cross
prop.table(cross, 1)
chisq.test(cross)

head(iris)
cor(iris$Sepal.Length, iris$Sepal.Width)
cor(iris$Petal.Length, iris$Petal.Width)
library(ggplot2)
ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point()

library(RMySQL)
con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'houseprices', host = 'localhost')
myQuery <- "select * from houseprices_1;"
df_ibnu<- dbGetQuery(con, myQuery)
View(df_ibnu)
cross <- xtabs(Price ~ Brick+Neighborhood, data=df_ibnu)
cross
prop.table(cross, 1)
chisq.test(cross)
head(df_ibnu)
cor(df_ibnu$Price, df_ibnu$SqFt)
cor(df_ibnu$Price, df_ibnu$Bedrooms)
cor(df_ibnu$Price, df_ibnu$Bathrooms)
library(ggplot2)
ggplot(df_ibnu, aes(x=SqFt, y=Price, color=Neighborhood)) + geom_point()

library(RMySQL)
con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'houseprices', host = 'localhost')
myQuery <- "select * from market_1;"
df_iibnu <- dbGetQuery(con, myQuery)
View(df_iibnu)
cross <- xtabs(Salary ~ OwnHome+Married, data=df_iibnu)
cross
prop.table(cross, 1)
chisq.test(cross)
head(df_iibnu)
cor(df_iibnu$Salary, df_iibnu$AmountSpent)
cor(df_iibnu$Salary, df_iibnu$Catalogs)
cor(df_iibnu$Salary, df_iibnu$Children)
library(ggplot2)
ggplot(df_iibnu, aes(x=AmountSpent, y=Salary, color=Age)) + geom_point()

