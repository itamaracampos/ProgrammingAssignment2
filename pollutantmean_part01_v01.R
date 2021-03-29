## Assignment WEEK02

## Notes

## >help(getwd)
## >?getwd  --> open a windon on Help window on Rstudio to explain the function 
## >getwd()  --> show the current directory

## to read csv files
##> data <- read.csv("001.csv", header = T) --> load the file on Rstudio, can see on Env. Windown 
##> View(data) --> to annalist the data


##?list.files -> create a caracter of the names of files specific in the directory
##?numeric --> create a vector of the objects the class numeric
##?read.csv --> to read csv files
##?c --> to concatened the values, functions, vectors
##? mean --> to calculate the mean of value


## Fist way to solve:
## when all the files are in the same directory of the code

pollutantmean <- function(directory, pollutant, id=1:332){
  mylist <- list.files(directory, full.names = T)
  x <- numeric()  ## create an empty vector
  for (i in id){
    mydata <- read.csv(mylist[i])
    x <- c(x , mydata[[pollutant]])
  }
    mean(x, na.rm = TRUE)
}

## to run in my console:
##> pollutantmean("specdata", "sulfate", 1:10)
##[1] 4.064128
##> 
