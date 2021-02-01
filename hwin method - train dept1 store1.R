library("forecast") #load forecast library

#Load the data
demandData <- traintest2

#Extract Time Series and Plot
dataFreq= 52          #Data frequency of time series
startEntry= c(2010,5) #Time stamp of first entry in time series

time_series <- ts(traintest2$Weekly_Sales, frequency=dataFreq,
               start=startEntry) #create a time series

#Plotting the time series results
plot(time_series,main = "Sales of Walmart store1 dept1",
     xlab="Year.week",ylab="Sales") #plot time series.

#Time Series decomposition
tsDecomp <- decompose(time_series,type="multiplicative") #classical decomposition. Can be set to multiplicative or additive

#Plot the decomposed time series
plot(tsDecomp) 

#Partition the data into training and test
trainSetStart = c(2010,5)
trainSetEnd   = c(2012,4) 
testSetStart  = c(2012,5) 
testSetEnd    = c(2012,52) 

#Extract training set
demandTrain <- window(time_series,start=trainSetStart,end=trainSetEnd) 

#Extract test set
demandTest  <- window(time_series,start=testSetStart,end=testSetEnd)   

#Forecasting Periods
numForcPeriods = 39 #number of periods to forecast in the future 

#Train Holt-Winters forecasting model.
HWForcModel <- HoltWinters(demandTrain,seasonal="multiplicative") 

#Make the forecasting using the model trained
HWForecast <- forecast(HWForcModel, h=numForcPeriods) 

#Plotting the Forecasting results
plot(HWForecast, main="Plot of training demand,
     testing demand, and forecast with 80% and 95%
     prediction intervals",xlab="Year.Week",
     ylab="Demand") #plot the training demand, and forecast with prediction intervals

lines(demandTest,col=2) #add the testing demand line to plot
legend("topleft", lty=1, col=c(1,4,2),
       legend=c("Training Demand","Forecast","Testing Demand")) #create plot legend

###########Analyze forecasting error#########
error = HWForecast$mean - demandTest #difference between forecast and actual demand
AD=abs(error) #absolute value of error

#Create empty vectors to store errors
MSE <- matrix(, nrow = numForcPeriods, ncol = 1)
MAD <- matrix(, nrow = numForcPeriods, ncol = 1)
MAPE <- matrix(, nrow = numForcPeriods, ncol = 1)
bias <- matrix(, nrow = numForcPeriods, ncol = 1)
TS <- matrix(, nrow = numForcPeriods, ncol = 1)

#Label columns of matrices using name of error
colnames(MSE) <- "MSE"
colnames(MAD) <- "MAD"
colnames(MAPE) <- "MAPE"
colnames(bias) <- "bias"
colnames(TS) <- "TS"

#compute errors
for(t in 1:numForcPeriods){
  MSE[t] <- mean(error[1:t]*error[1:t])
  MAD[t] <- mean(AD[1:t])
  MAPE[t] <- mean(100*abs(error[1:t]/demandTest[1:t]))
  bias[t] <- sum(error[1:t])
  TS[t]= bias[t]/MAD[t]
}

#combined vectors into a dataframe, also appending year and quarter information in the first two columns
error_Meas <- data.frame(floor(time(error)),cycle(error),demandTest,HWForecast$mean,error,AD,MSE,MAD,MAPE,bias,TS)
colnames(error_Meas)[1] <- "Year"
colnames(error_Meas)[2] <- "Week"
colnames(error_Meas)[3] <- "Actual demand"
colnames(error_Meas)[4] <- "Forecast"