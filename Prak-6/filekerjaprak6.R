library(RMySQL)
con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'dblatihan', host = 'localhost')
myQuery <- "select * from reg;"
reg <- dbGetQuery(con, myQuery)
View(reg)
head(reg)
model=lm(volume_penjualan ~ pengeluaran_iklan + jenis_media, data = reg)
model
summary(model)

con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'dblatihan', host = 'localhost')
myQuery <- "select * from reg2;"
reg2 <- dbGetQuery(con, myQuery)
View(reg2)
head(reg2)
model1=lm(ji_y ~ X2 + X2 + X3, data = reg2)
model1
summary(model1)

reg=read.delim("clipboard")
View(reg)
head(reg)
model=lm(y ~ x + x2, data = reg)
model
summary(model)

con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'houseprices', host = 'localhost')
myQuery <- "select * from market_1;"
market_1 <- dbGetQuery(con, myQuery)
head(market_1)
install.packages("olsrr")
install.packages("lmtest")
library(olsrr)
library(lmtest)

market_1[market_1 == "Female"] <- "1"
market_1[market_1 == "Male"] <- "0"
model=lm(AmountSpent ~ Salary + Gender, data = market_1)
model
summary(model)
ols_plot_resid_qq(model)
lmtest::bptest(model)
dwtest(model)
ols_vif_tol(model)

model=lm(AmountSpent ~ Salary + Age, data = market_1)
model
summary(model)
ols_plot_resid_qq(model)
lmtest::bptest(model)
dwtest(model)
ols_vif_tol(model)
