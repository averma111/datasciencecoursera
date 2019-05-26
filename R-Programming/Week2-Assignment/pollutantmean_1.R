pollutantmean<-function(directory,pollutant,id=1:332) 
{
  fileList <- list.files(path = directory, pattern = ".csv")
  values<- numeric() 
  for(i in id) {
    data<- read_csv(fileList[i])
    values<-c(values,data[[pollutant]])
  }
  mean(values, na.rm = TRUE)
}

