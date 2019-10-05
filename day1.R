library(ggplot2)
library(car)
library(corrplot)
library(caret)

#loading data
d=mtcars

#looking variables
str(d)

#to see the distribution of the variables
summary(d)

#mpg :-Miles/(US) gallon is dependent or target variables here
#correcting collinearity
#Dropping dependent variable for calculating Multicollinearity
d_a = subset(d, select = -c(mpg))


#calculating correlation:
c=cor(d_a)
print(c)
corrplot(c, order = "FPC", method = "color", type = "lower", tl.cex = 0.7, tl.col = rgb(0, 0, 0))



# Checking Variables that are highly correlated
#library(caret)
highlyCorrelated = findCorrelation(c, cutoff=0.7)

#Identifying Variable Names of Highly Correlated Variables
highlyCorCol = colnames(c)[highlyCorrelated]

#Print highly correlated attributes
highlyCorCol





#Build Linear Regression Model
linear= lm(mpg ~ .+0, data=d)

#Check Model Performance
summary(linear)



# weighted linear regression
linear= lm(mpg ~ .+0, data=d,weights=1/SD^2)


mean(0.000090700,0.98887327)


#Extracting Coefficients
summary(linear)$coeff
anova(linear)




# Calculating Model Performance Metrics
#Extracting R-squared value
summary(linear)$r.squared

#Extracting adjusted R-squared value
summary(linear)$r.squared

AIC(linear)


