library(xlsx)
URL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url = URL,destfile = "./gov_NGAP.xlsx",method = "curl")

dat<-read.xlsx(file ="gov_NGAP.xlsx",sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15 )
sum(dat$Zip*dat$Ext,na.rm=T)