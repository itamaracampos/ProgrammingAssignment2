## Assignment WEEK02

## Notes

## >help(getwd)
## >?getwd  --> open a windon on Help window on Rstudio to explain the function 
## >getwd()  --> show the current directory

## to read csv files
##> data <- read.csv("001.csv", header = T) --> load the file on Rstudio, can see on Env. Windown 
##> View(data) --> to annalist the data


##?list.files -> create a caracter of the names of files specific in the directory
##?read.csv --> to read csv files
##?pCol --> 
##? mean --> to calculate the mean of value


## second way to solve:
## when all the files are in the same directory of the code

pollutantmean <- function(directory, pollutant, id )  {
  files_list <- list.files(directory, full.names = T)
  pollutant.vec <- numeric(0)
  for (i in id) {
    df <-(read.csv(files_list[i]))
    pCol <- df[, pollutant] 
    pollutant.vec <- c(pollutant.vec, pCol)
  }
  mean(pollutant.vec, na.rm = T)
}

## to run in my console:
##> pollutantmean("specdata", "sulfate", 1:10)
##[1] 4.064128
##> 
