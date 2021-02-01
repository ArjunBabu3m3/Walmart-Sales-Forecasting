# Walmart-Sales-Forecasting

![alt text](/pics/walmart0.1.jpg)

### Table of contents
* [Introduction](#introduction)
* [Problem Statement](#problem-statement)
* [Data Source](#data-source)
* [Technologies](#technologies)
* [Type of Data](#type-of-data)
* [Data Preparation](#data-preparation)
* [Algorithms Implemented](#algorithms-implemented)
* [Exploratory Analysis](#exploratory-analysis)
* [Models Analysis](#models-analysis)
* [Forecast Value Analysis(FVA)](#forecast-value-analysis(fva))
* [Forecast of Sales - ARIMA Method - One Store](#forecast-of-sales---arima-method---one-store)
* [Forecast Data and Results](#forecast-data-and-results)

### Introduction
The objective of the project is to predicted the department wise sales for 45 Walmart stores modeling the effects of markdowns on holidays . You are provided with historical sales data for 45 Walmart stores located in different regions. Each store contains a number of departments, and you are tasked with predicting the department-wide sales for each store.

In addition, Walmart runs several promotional markdown events throughout the year. These markdowns precede prominent holidays, the four largest of which are the Super Bowl, Labor Day, Thanksgiving, and Christmas. The weeks including these holidays are weighted five times higher in the evaluation than non-holiday weeks. Part of the challenge presented by this competition is modeling the effects of markdowns on these holiday weeks in the absence of complete/ideal historical data.

### Problem Statement
* Predicted the department wise sales for 45 Walmart stores modeling the effects of markdowns on holidays using the ARIMA and Holt-Winters model

### Data Source
* Kaggle - https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting

### Technologies
* R 3.6.2
* R Studio

### Type of Data
*  In the given data, we have 45 stores and each stores have around 90 departments.

### Data Preparation
* The data of store 1 of all 45 stores for our forecast analysis
* Holt Winters, ARIMA, Naïve, & Mean method are used for comparison
* The demand values are the total demand of all departments combined for the week.

### Algorithms Implemented
* Holts Winter Model
* Naive method and Mean method
* ARIMA method

### Exploratory Analysis

* Holts Winter Model

![alt text](/pics/walmart1.JPG)

We understand from the above sales plot that there is a seasonality to the data which needs to be removed before proceeding for the Forecast

* Naive method and Mean method

![alt text](/pics/walmart2.JPG)

Comparing both these plots with the sales Plot, we can infer that Fuel prices doesn’t affect 
the sales and as the temperature changes from season to season, it can be considered as part 
of seasonality  and can be de-seasonalised. 

### Models Analysis

### Model 1 - Holts Winter Model
![alt text](/pics/walmart3.JPG)

* We can see that the demand is significantly high in the Q1 and Q4 in each year
* This data also signifies that the demand values follow the same trend.
* The forecast says that the Testing data follows the same trend.
* But, 2012 Q1 & Q2 demand values shows that most of the predicted data lies outside the 80% & 95% confidence levels.

### Model 2 - Naive method and Mean method
![alt text](/pics/walmart4.JPG)

* Both these methods infer that we get the forecast well within the confidence level.
* But the forecasted data did not show any trend and is flat throughout the period.
* Hence these methods are not recommended for predicting the future sales.
  
### Model 3 - ARIMA Model
![alt text](/pics/walmart5.JPG)

* By look of the forecast plot, we can say that the data follows the previous period`s trend and is well within the confidence levels. 
* We need to find the accuracy of each plot in addition to the confidence levels and trend to determine the best model.

### Forecast Value Analysis(FVA) 

#### Predicting the best model
From all the 4 forecasting methods, we can see that the Forecast in the Increasing trend and inline with the testing data.
By calculating the MAPE of all these models we found that:

* MAPE Naïve method: 28.91%
* MAPE Mean method: 19.08%
* MAPE ARIMA method: 1.81%
* MAPE Holt Winters Method: 20.56%

ARIMA has the lowest error and hence it is the best method to forecast the Sales data

### Forecast of Sales - ARIMA Method - One Store
![alt text](/pics/walmart6.JPG)

### Forecast Data and Results
![alt text](/pics/walmart7.JPG)

