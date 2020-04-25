## Bollinger Bands - Disney example
## data --> https://www.google.com/finance/historical?q=NYSE:DIS
## http://www.tradinggeeks.net/2014/07/technical-analysis-with-r/
##
##

rm(list = ls())

gc()

data.disney <- read.csv(file.choose(), header = TRUE, stringsAsFactors = FALSE)

View(data.disney)

attach(data.disney)

install.packages("TTR")
library(TTR)

## sma20 <- SMA(Close, 20)
## View(sma20)

bb20 <- BBands(Close, n = 20, sd = 2)
View(bb20)

data.disney.bbands <- data.frame(data.disney, bb20)
View(data.disney.bbands)

## attach(data.disney.bbands)
## plot(data.disney.bbands$Date, data.disney$Close, xlim = c(as.Date("10-21-15"),as.Date("09-21-16")), ylim = c(min(data.disney$Close), max(data.disney$Close)))
## lines(data.disney.bbands$Close, col ="red")
## lines(data.disney.bbands$up, col = "purple")
## lines(data.disney.bbands$dn, col = "brown")
## lines(data.disney.bbands$mavg, col = "blue")

newdata <- data.disney.bbands[21:250, ]
attach(newdata)
plot(Date, Close, cex = 0.5, pch = 3)
lines(Date, Close, col = "red")
lines(Date, up, col = "purple")
lines(Date, dn, col = "brown")
lines(Date, mavg, col = "blue")

newdatashort <- data.disney.bbands[230:250, ]
attach(newdatashort)
plot(Date, Close, cex = 0.5, pch = 3, ylim = c(90.5, 100))
lines(Date, Close, col = "red")
lines(Date, up, col = "purple")
lines(Date, dn, col = "brown")
lines(Date, mavg, col = "blue")



## plot(data.disney.bbands$Date, data.disney$Close)
## lines(data.disney.bbands$Close, col ="red")
## lines(data.disney.bbands$up, col = "purple")
## lines(data.disney.bbands$dn, col = "brown")
## lines(data.disney.bbands$mavg, col = "blue")
