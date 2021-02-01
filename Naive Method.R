library("forecast") #load forecast library

#Load the data
demandData <- traintest2

#Extract the data
dataFreq= 52          #Data frequency of time series
startEntry= c(2010,5) #Time stamp of first entry in time series

time_series <- ts(traintest2$Weekly_Sales, frequency=dataFreq,
               start=startEntry)

mn = naive(time_series,h=39) 

#Plotting the results
plot(mn)

#Calculating its accuracy
accuracy(mn) 