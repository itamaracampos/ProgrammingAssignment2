
## Write a function that takes a directory of data files and a threshold
## for complete cases and calculates the correlation between sulfate and 
## nitrate for monitor locations where the number of completely observed 
## cases (on all variables) is greater than the threshold. The function 
## should return a vector of correlations for the monitors that meet the 
## threshold requirement. If no monitors meet the threshold requirement, 
## then the function should return a numeric vector of length 0. 
## A prototype of this function follows


##################

corr <- function(directory, threshold = 0) {
  id = 1:332
  filename <- list.files(directory, full.names = TRUE)
  
  result <-vector(mode="numeric", length=0)
  
  for(i in seq(filename)) {
    airquality <- read.csv(filename[i])
    good <- complete.cases(airquality)
    airquality <- airquality[good, ]
    if (nrow(airquality) > threshold) {
      # We need [[]] around pollutant instead of [] since airquality["sulfate"]
      # is a data.frame but we need a vector here. Hence, [[]]. Please note thatusing either
      #[[]] or [] gives the same results as the test cases
      correlation <- cor(airquality[["sulfate"]], airquality[["nitrate"]])
      result <- append(result, correlation)
      #print(correlation)
    }
  }
  result
}



## For this function you will need to use the 'cor' function in R which calculates
## the correlation between two vectors. Please read the help page for this
## function via '?cor' and make sure that you know how to use it.


##### solution!!
