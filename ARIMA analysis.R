library("forecast")   #load forecast library
library("fUnitRoots") #For stationary data

#LOad the training data
Weeksly.sales.of.store.1 <- read.csv("C:/Users/bvsba/Desktop/UIC/Semester 2/IDS 552 - SCM/Assignment 2/Case Study 1/Weeksly sales of store 1.csv")

data_freq= 52         #Data frequency of time series.
start_date= c(2010,5) #Time stamp of first entry in time series.

#Create a time series on the training data provided
time_series <- ts(Weeksly.sales.of.store.1$sum.of.sales.of.all.depts, frequency=data_freq, start=start_date) 

#PLotting the time series results obtained from the above algorithm
plot(time_series,main = "Sales of Walmart store1 dept1",
     xlab="Year.week",ylab="Sales") 

#Decompose time series and ploting the results. Decompose methods return an object containing
ts_decomp <- decompose(time_series) #classical decomposition. Can be set to multiplicative or additive

#plot decomposed time series
plot(ts_decomp) 

#Partition the dataset into training and test for our analysis
trainSetStart= c(2010,5) 
trainSetEnd  = c(2012,4)   
testSetStart = c(2012,5)  
testSetEnd   = c(2012,52)   

#Extract training set
train_data <- window(time_series,start=trainSetStart,end=trainSetEnd) 
#Extract test set
test_data  <- window(time_series,start=testSetStart,end=testSetEnd) 

#To keep the data stationary
urkpssTest(time_series, type = c("tau"), lags = c("short"),use.lag = NULL, doplot = TRUE)
stationary_data = diff(time_series, differences=1)
plot(stationary_data, main = "After removing non stationarity")

#Calculate Autocorrelation
acf(time_series,lag.max=34)

#Removing seasonality
timeseriesseasonallyadjusted <- time_series- ts_decomp$seasonal
tsseasonality <- diff(timeseriesseasonallyadjusted, differences=1)

plot(tsseasonality, main="Removing Seasonality and making data Stationary")
par(mfrow=c(2,1))
acf(tsseasonality, lag.max=34) 
pacf(tsseasonality, lag.max=34)

#Fitting the model
autoarima1 <-auto.arima(time_series)
forecast1 <- forecast(autoarima1, h=39)

#Plotting the forecasting results
plot(forecast1)
plot(forecast1$residuals)

#Plotting the qqnorm for checking the normality
qqnorm(forecast1$residuals)
qqline(forecast1$residuals)
acf(forecast1$residuals)
pacf(forecast1$residuals)

#Finally checking the summary results
summary(autoarima1)

