
## Write a function that takes a directory of data files and a threshold
## for complete cases and calculates the correlation between sulfate and 
## nitrate for monitor locations where the number of completely observed 
## cases (on all variables) is greater than the threshold. The function 
## should return a vector of correlations for the monitors that meet the 
## threshold requirement. If no monitors meet the threshold requirement, 
## then the function should return a numeric vector of length 0. 
## A prototype of this function follows


##################
corr<-function(directory,threshold=0){
  #create list of file names
  myfiles <- list.files(directory,full.names = TRUE)
  
  #create empty vector
  dat <- vector(mode = "numeric", length = 0)
  
  for(i in 1:length(myfiles)){
    #read in file
    temp <- read.csv( myfiles[i], header=TRUE)
    #delete NAs
    temp <- temp[ complete.cases(temp),]
    #count the number of observations
    csum <- nrow(temp)
    #if the number of rows is greater than the threshold
    if( csum > threshold){
      #for that file you find the correlation between nitrate and sulfate
      #combine each correlation for each file in vector format using the concatenate function 
      #since this is not a data frame we cannot use rbind or cbind
      dat <- c(dat , cor(temp$nitrate,temp$sulfate))
    }
    
  }
  
  return(dat)
}
## For this function you will need to use the 'cor' function in R which calculates
## the correlation between two vectors. Please read the help page for this
## function via '?cor' and make sure that you know how to use it.


##### solution!!
