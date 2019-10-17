# In Data Science world, main goal of Data Visualization is to communicate information clearly and effectively through graphical means.

# R offers various methods through inbuilt graphics and powerful packages such as ggolot2.
# ggplot2 : is a versatile R package, developed by the most well known R developer "Hadley Wickham" ,for generating aesthetic/beautiful plots and charts. 

# ggplot2 implies "Grammar of Graphics" which says a plot can be split into three basic parts which is : 
# Plot = data + Aesthetics + Geometry, data refers to dataset, aesthetics indicates x and y variables and also used to tell color, size of points etc and Geometry refers to graphics (bar chart, histogram , box plot, line plot, density plot, etc)

# let us use cars dataset (cars is a standard built in dataset which is having 2 variables i.e. Distance(dist) and Speed (speed)). It's good practice to analyze and understand the variables so let's understand these variables graphically.

# 1. Scatter Plot : to visualize linear relationship/ to graphically represent relationship between two continuous variables i.e. between independent(predictor) and dependent(response) variables.

# install.packages("ggplot2")
library(ggplot2)
ScatterPlot <- ggplot2::ggplot(data = cars,aes(x= speed,y= dist)) + geom_point()
ScatterPlot

# Scatter plot here suggests a linearly increasing relationship between "dist" and "speed" variables and it is actually satisfying an assumption in linear regression i.e. the relationship between response variable and predictor/s is linear.

# 2. Box plot : for outlier detection 
ggplot(data= cars) + geom_boxplot(aes_string(y = cars$speed,x = 0)) #box plot for speed which is having no outliers

# box plot for distance is having outliers (which is basically outside the range from Q1-1.5*IQR or Q3+1.5*IQR) where Q1 and Q3 are 1st and 3rd quartiles Q2 is median or 2nd quartile.
ggplot(data= cars) + geom_boxplot(aes_string(y = cars$dist,x = 0)) # box plot for distance

# let's calculate Outlier in this case manually
Dist_Df <- cars$dist
Dist_Df <- sort(Dist_Df)
Q2 <- median(Dist_Df)
Q1 <- median(Dist_Df[which(Dist_Df < Q2)]) # Q1 is median of values smaller than median i.e. Q2
Q3 <- median(Dist_Df[which(Dist_Df > Q2)]) # Q1 is median of values greater than median i.e. Q2

IQR <- Q3-Q1
Lower_Whisker <- (Q1 - 1.5*IQR)
Upper_Whisker <- (Q3 + 1.5*IQR)

# so all the values which is smaller than Lower_Whisker and values which are greater than Upper_Whisker will be considered as an Outlier, in this care 120 is treated as an outlier as it is higher than the upper whisker.

# 3. Density Plot: To see the distribution of predictor variable, Ideally, a closed to normal distribution (a bell shaped curve), without being skewed to the left or right is preffered.

# Density plot is basically used to present the distribution of a continuous variable.
ggplot(data = cars ,aes(x = speed)) + geom_density()
ggplot(data = cars ,aes(x = dist)) + geom_density()


# 4. Correlation : It is a statistical measure that suggests the level of linear dependence between two variable(Dependent and Independent). 
cor(cars$speed,cars$dist) # Calculating correlation between speed and distance

# correlation can take values between -1 to 1 , here correlation value is 0.8068949 i.e close to one indicates good correlation and if the value is closer to 0 suggests a weak relationship between the variables (means variation in response variable (y) is unexplained by the predictor(x)).

# After looking into these plots say scatter plot and by computing the correlation we are good to build linear model.
                               