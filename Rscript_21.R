#Lec 7, I573
#source:
#   https://rstudio-pubs-static.s3.amazonaws.com/102341_ab0c112cca9c45e69c5c33683bc803bb.html
#   http://rstudio-pubs-static.s3.amazonaws.com/138329_9a2effee5e1249a5aec8cc640b25bb16.html
#   https://rpubs.com/BillB/217355
##Exercises
# Exercise 1:

# Assign x <- c(1,2,3,4)

# Using the function rep() create the below sequence

# 1,2,3,4,1,2,3,4,1,2,3,4

x <- c(1,2,3,4)
rep(x, times = 3)
##  [1] 1 2 3 4 1 2 3 4 1 2 3 4
# Exercise 2:

# Assign x<- c(1,2,3,4)

# Using the rep() function generate the sequence 1,1,1,2,2,2,3,3,3,4,4,4

x <- c(1,2,3,4)
rep(x, each = 3)
##  [1] 1 1 1 2 2 2 3 3 3 4 4 4
#Function
# Exercise 1 

#function
f.uniq <- function (v) {
  s <- c()
  
  for(i in 1:length(v)) {
    if(sum(v[i] == s) == 0) {
      s <- c(s, v[i])
    }
  }
  s
}

#run function
f.uniq(c(9, 9, 1, 1, 1, 0))


# Exercise 2

desi <- function(x, med=FALSE) {
  
  mean <- round(mean(x), 1)
  stdv <- round(sd(x), 1)
  cat("Mean is:", mean, ", SD is:", stdv, "\n")
  
  if(med) {
    median <- median(x)
    cat("Median is:", median , "\n")
  }
}

#run function

desi(1:10, med=TRUE)


#######STATISTICS
fivenum(c(rnorm(100), -1:1)) #mean plus quantiles

x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
# compute the list mean for each list element
lapply(x, mean)
# median and quartiles for each list element
lapply(x, quantile, probs = 1:3/4)
sapply(x, quantile)
# Correlations/covariances among numeric variables in
# data frame mtcars. Use listwise deletion of missing data.
cor(mtcars, use="complete.obs", method="kendall")
cov(mtcars, use="complete.obs")

############ Mor statistical analysis
attach(mtcars)
data=mtcars
head(data,3)
data$am=factor(data$am) #numeric to factor
str(data)
#mean by cylinders
tapply(mpg,cyl,mean)
#Regression model
lm.fit=lm(mpg~am,data=data)
summary(lm.fit)
#Interpret coefficients
#From the regressiom output, the estimated coefficients are all postive which means 
#manual transmissions perform the positive affection on mpg, and the P-Value are all smaller than 0.5,
#therfore, the null hypothesis of the coefficients are equal to 0 is refused. 
#but the Adjusted R-squared value is 0.3385, which is not bigger.
lm.fit.f=lm(mpg~wt+am+wt:am+qsec,data=data)
summary(lm.fit.f)

##anova on multiple fits
car.fit1 <- lm(mpg ~ wt, data = mtcars)
car.fit2 <- lm(mpg ~ wt + qsec, data = mtcars)
car.fit3 <- lm(mpg ~ wt + qsec + am, data = mtcars)
anova(car.fit1, car.fit2, car.fit3)

############# ttest

data(chickwts)
attach(chickwts)
names(chickwts)

our.mu = mean(weight)
just.casein = weight[feed == 'casein']
t.test(just.casein,mu = our.mu)

# two sample t-test
t.test(weight[feed == 'casein'],weight[feed == 'sunflower'])


#simulation
# 
# How robust is the distribution of t to changes in the distribution of Xi?
#   This is the job of simulation. We use the computer to generate random data and investigate the results. Suppose our R session is already running and just want to get to work.
# 
# First, let's define a useful function to create the t statistic for a data set.

make.t = function(x,mu) (mean(x)-mu)/( sqrt(var(x)/length(x)))
#Now, when we want to make the t-statistic we simply use this function.

mu = 10
x=rexp(100,1/mu)
make.t(x,mu)

results = c()                    # initialize the results vector
for (i in 1:200) results[i] = make.t(rexp(100,1/mu),mu)
hist(results)
boxplot(results)

















