library(anytime)
library(dplyr)
library(forecast)
library(xts)
library(timeSeries)
library(tseries)
library(quantmod)
library(tidyquant)
data = read.csv("D:\\SMK\\DA\\R\\Project\\Datasets\\TCS.csv")
data
View(data)
head(data)
summary(data)
str(data)

for (x in 3:14) {
  data[,x] = as.numeric(gsub(",","",data[,x]))
}
# data[,2:11] = as.numeric(gsub(",","",as.character(data[,2:11])))
data$Date.=anydate(data$Date.)
summary(data)
str(data)

#b=xts(data[,2:11],order.by = data[,1]) # converting to time series object
h=xts(data$close.,order.by = data$Date.) # converting to time series object
plot(h)
class(h)
View(h)
str(h)

par(mfrow = c(1,2))
Acf(h, main="ACF")
Pacf(h, main="Pacf")

print(adf.test(h))
auto.arima(h, seasonal = FALSE)

fitA = auto.arima(h,seasonal = FALSE)
tsdisplay(residuals(fitA), lag.max = 40, main = "res")



fcast1 = forecast(fitA)
plot(fcast1)
fcast1