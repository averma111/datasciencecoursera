  mypollutmean<-function(directory,pollutant,id=1:332){
    
    fileslist<-list.files(path=directory,pattern = ".csv", full.names = TRUE)
    
    dat<-data.frame()
    
    for(i in id){
      
      dat<-rbind(dat,read.csv(fileslist[i]))
      
    }
    mymean<-mean(dat[,pollutant], na.rm=TRUE)
    print(mymean)
  }