ricesupply=read.csv("D:/File Kuliah Semester 5/Data Analitik/Prak-9/ricesupply.csv", sep = ";")
View(ricesupply)

supply <- ts(ricesupply$Karawang, start = c(2011, 1), frequency = 12)
plot(supply)

library(forecast)
fit <- HoltWinters(supply)
accuracy(forecast(fit))
f1 <- forecast(fit,h=12)
print(f1)
forecast(fit,12)
plot(fit)

##ek 2
ricets <- ts(ricesupply$Cirebon, frequency=12, start=c(2011,1))
ricets
plot.ts(ricets)

fit <- stl(ricets, s.window="periodic")
plot(fit)

accuracy (forecast(fit))
fit <- forecast(ricets)
accuracy(fit)

ricedec <- decompose(ricets)
ricedec$seasonal
plot(ricedec)

View(ricets)
install.packages("xlsx")
library(xlsx)
write.xlsx(ricets, "D:/File Kuliah Semester 5/Data Analitik/Prak-9/9ibnu.xlsx")

##ek 3
supply <- ts(ricesupply$Cianjur, start = c(2011, 1), frequency = 12)
plot(supply)

library(forecast)
fit <- HoltWinters(supply)
accuracy (forecast(fit))
f1 <- forecast(fit,h=12)
print(f1)
forecast(fit,12)
plot(fit)

ricets <- ts(ricesupply$Cianjur, frequency=12, start=c(2011,1))
ricets
plot.ts(ricets)

fit <- stl(ricets, s.window="periodic")
plot(fit)

fit <- forecast(ricets)
accuracy(fit)
ricedec <- decompose(ricets)
ricedec$seasonal
plot(ricedec)

View(ricets)
library(xlsx)
write.xlsx(ricets, "D:/File Kuliah Semester 5/Data Analitik/Prak-9/Cianjur.xlsx")

##ek3hargaberas
harga=read.csv("D:/File Kuliah Semester 5/Data Analitik/Prak-9/hargaberas.csv")
View(harga)

supply <- ts(harga$Setra, start = c(2011, 1), frequency = 12)
plot(supply)

library(forecast)
fit <- HoltWinters(supply)
accuracy (forecast(fit))
f1 <- forecast(fit,h=12)
print(f1)
forecast(fit,12)
plot(fit)

harga_beras <- ts(harga$Setra, frequency=12, start=c(2011,1))
harga_beras
plot.ts(harga_beras)

fit <- stl(harga_beras, s.window="periodic")
plot(fit)

fit <- forecast(harga_beras)
accuracy(fit)
hargadec <- decompose(harga_beras)
hargadec $seasonal
plot(hargadec)

View(hargadec)
library(xlsx)
write.xlsx(ricets, "D:/File Kuliah Semester 5/Data Analitik/Prak-9/hargaberasek3.xlsx")

