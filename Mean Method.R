library("forecast") #load forecast library

#Load the data
demandData <- traintest2

#Extract the data
dataFreq= 52          #Data frequency of time series
startEntry= c(2010,5) #Time stamp of first entry in time series

time_series <- ts(traintest2$Weekly_Sales, frequency=dataFreq,
               start=startEntry)
mf = meanf(time_series,h=39,level=c(90,95),fan=FALSE,lambda=NULL)

#Plotting the results
plot(mf)

#Calculating its accuracy
accuracy(mf)