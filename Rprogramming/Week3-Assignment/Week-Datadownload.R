filezip<-"Week3_Final.zip"

#Checking if the file already exists

if(!file.exists(filezip)){
  fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 # download.file(url = fileurl,destfile = filezip, method = "curl")
}

#Checking if the folder exits
if(file.exists("UCI HAR Dataset")){
  unzip(filezip)
}