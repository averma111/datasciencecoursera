mycomplete<-function(directory,id=1:332){
  
  listfiles<-list.files(path=directory,pattern=".csv",full.names = TRUE)
  
  dat<-data.frame()
  
  for(i in id){
    nobs<-sum(complete.cases(read.csv(listfiles[i])))
    temp<-data.frame(i,nobs)
    dat<-rbind(dat,temp)
  }
  colnames(dat)<-c("id","nobs")
  dat
}