library(xlsx)

##### R CODE FOR RESTAURANT MODEL

restData <- read.xlsx ("C:\\Users\\Martin\\Documents\\SASUniversityEdition\\myfolders\\statFoundations\\session12\\session12Data.xlsx", "restaurantSAS")

rest.lm <- lm(restSales ~ pop + income, data=restData)
summary(rest.lm)

##Three of the graphs can be obtained by simply plotting the model fit
par(mfrow=c(2,2))
plot(rest.lm, which=c(1:3))

##Histogram with normal curve Store studentized residuals
studresRest <- rstudent(rest.lm)

##Histogram 
hist(studresRest, freq=FALSE, main="Distribution of Studentized Residuals",
     xlab="Studentized Residuals", ylab="Density", ylim=c(0,0.5))

##Create range of x-values for normal curve
xfit2 <- seq(min(studresRest)-1, max(studresRest)+1, length=40)

##Generate values from the normal distribution at the specified values
yfit2 <- (dnorm(xfit2))

##Add the normal curve
lines(xfit2, yfit2, ylim=c(0,0.5))

##### R CODE FOR CHARITY MODEL

charityData <- read.xlsx ("C:\\Users\\Martin\\Documents\\SASUniversityEdition\\myfolders\\statFoundations\\session12\\session12Data.xlsx", "charity")
charityData
charity.lm <- lm(charity ~ imp + wealth +imp*wealth, data=charityData)
summary(charity.lm)

##Three of the graphs can be obtained by simply plotting the model fit
par(mfrow=c(2,2))
plot(charity.lm, which=c(1:3))

##Histogram with normal curve Store studentized residuals
studresRest <- rstudent(charity.lm)

##Histogram 
hist(studresRest, freq=FALSE, main="Distribution of Studentized Residuals",
     xlab="Studentized Residuals", ylab="Density", ylim=c(0,0.5))

##Create range of x-values for normal curve
xfit2 <- seq(min(studresRest)-1, max(studresRest)+1, length=40)

##Generate values from the normal distribution at the specified values
yfit2 <- (dnorm(xfit2))

##Add the normal curve
lines(xfit2, yfit2, ylim=c(0,0.5))


