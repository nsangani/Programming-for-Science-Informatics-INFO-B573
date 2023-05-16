# Q-1 3points (1 Point each)

# A) Create vector with value 5,10,15,20,25,30 and write code to print values with greater than 20.

vec1 = seq(5,30,5)
idx = which(vec1 > 20) # find index that has value greater than 20
vec1[idx] # print these indexes

# B) Create logical vector TRUE, FALSE, TRUE, FALSE, FALSE, TRUE and write code to print values of vector 
# provided in Q-1A by applying given logical vector. (See lecture 6 slide:15)

Logic_vec = c(TRUE, FALSE, TRUE, FALSE, FALSE, TRUE)
vec1[Logic_vec] #print values of vec where logic vec = true


#C) Create a list from vectors in Q-1 A & B, write a code to access 3rd value of 2nd member in the list.

list1 = list(vec1, Logic_vec)
list1[[2]][3] #3rd value of 2nd list/member

# Q-2

# A) Create user define a function which matrix as an input. Transpose input matrix, multiply the matrix by 3 and output matrix

transponse_matrix = function(x){
    tp = t(x)*3
    return(tp)
  }

example_matrix = matrix(1:9, nrow = 3, ncol = 3) # example matrix
example_matrix
transponse_matrix(example_matrix) # use of the function to transpose and multiple the example matrix


# B) Create user define a function in R which takes a numeric vector as an input and print output as sum, mean, median and standard deviation. 
# Add a logical variable as "vector length" (see lecture 7 slide:35).

general_stat = function(vec, vector_length = TRUE) {
  if(length(vec) > 1) out = 1
  if(length(vec) < 1) out = 0
  
  if (vector_length) cat('finished running','\n')
  s = sum(vec)
  cat('Sum: ',s, '\n')
  m = mean(vec)
  cat('Mean: ',m, '\n')
  med = median(vec)
  cat('Median: ',med, '\n')
  stand_dev = sd(vec)
  cat('Standard Deviation: ',stand_dev, '\n')
  return(out)
}

vec = c(1,2,3,4,5)
general_stat(vec, vector_length = T)


# Q-3  4 points (2 points each. Need to submit plot files/images to get full points)

# A) Read csv file Assignment4.csv and draw a heatmap. (Hint: reading file use row.names = 1 and Converting data.frame to numeric matrix use function "as.matrix" or "data.matrix")

file1 = read.csv("Assignment4.csv", row.names = 1)
file1_mat = as.matrix(file1)
heatmap(file1_mat)

# B) By using ggplot and preloaded midwest data. By limit your axis xlim=c(0,0.1), ylim=c(0, 500000) Plot area vs popadults and 
# color points by states with size = 2. (refer tutorial: http://r-statistics.co/Complete-Ggplot2-Tutorial-Part1-With-R-Code.html)

library(ggplot2)
data("midwest", package = "ggplot2")
ggplot(midwest, aes(x=area, y=popadults)) +
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 500000)) + 
  labs(title="Area Vs Adults Population") +
  geom_point(aes(col=state), size=2)
  


