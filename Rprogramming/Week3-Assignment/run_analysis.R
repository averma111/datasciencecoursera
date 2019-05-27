#Loading the dplyr package into script
library(dplyr)

#Sourcing the respective files to use the created variables
source('~/R-Data Science/datasciencecoursera/Rprogramming/Week3-Assignment/Week3-DataCreation.R')
source('~/R-Data Science/datasciencecoursera/Rprogramming/Week3-Assignment/Week3-Datadownload.R')

#Merging the data into one dataset for test and train
X<-rbind(x_train,x_test)
Y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject.test)
Merged_data_set<-cbind(subject,X,Y)

#Extracting the data based on means and standard deviation from previouisly created merged data.
tidydataset<-Merged_data_set %>% select(subject,code,contains("mean"),contains("std"))

#Naming the activities in the dataset
tidydataset$code<-activities[tidydataset$code,2]

#Labling the dataset with appropriate names
names(tidydataset)[2]<-"activity"
names(tidydataset)<-gsub("Acc","Accelerometer",names(tidydataset))
names(tidydataset)<-gsub("Gyro", "Gyroscope", names(tidydataset))
names(tidydataset)<-gsub("BodyBody", "Body", names(tidydataset))
names(tidydataset)<-gsub("Mag", "Magnitude", names(tidydataset))
names(tidydataset)<-gsub("^t", "Time", names(tidydataset))
names(tidydataset)<-gsub("^f", "Frequency", names(tidydataset))
names(tidydataset)<-gsub("tBody", "TimeBody", names(tidydataset))
names(tidydataset)<-gsub("-mean()", "Mean", names(tidydataset), ignore.case = TRUE)
names(tidydataset)<-gsub("-std()", "STD", names(tidydataset), ignore.case = TRUE)
names(tidydataset)<-gsub("-freq()", "Frequency", names(tidydataset), ignore.case = TRUE)
names(tidydataset)<-gsub("angle", "Angle", names(tidydataset))
names(tidydataset)<-gsub("gravity", "Gravity", names(tidydataset))

#Creating the independent dataset from above created data set
summarydata<-tidydataset %>% group_by(subject,activity) %>% summarise_all(funs(mean))

#Writing the file data into text file
write.table(summarydata,"SummaryData.txt",row.names = FALSE)


#Checking the final data by using structure function.
str(summarydata)