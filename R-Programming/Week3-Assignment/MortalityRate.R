##Histogram plot for Mortality Rate

path<-"/home/ashish/Downloads/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv"
#Reading csv file
data<-read.csv(file = path, sep = ",",colClasses = "character")
#converting data to numeric
plot_hist<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
#Ploting histogram
hist(plot_hist,main = "Mortality Rate",xlab = "Rate" )