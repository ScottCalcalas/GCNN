


#*For fyp Scott
#*
#*2022.11.29
#*
#*Do plot 
#*
#*TYPE: 16 features
#*
#*3 class



# data

plotw0all<-read.table("plotw0all.txt",sep=",")
plotf1all<-read.table("plotf1all.txt",sep=",")
plotm3all<-read.table("plotm3all.txt",sep=",")

#*****************************************************************
# one channel one graph ----------Different state, One feature
Feature=c(1:16)

state=c("Normal","Acute","Chronic")
PlotDATA=rbind(plotw0all,plotf1all,plotm3all)




giveDiffSTATE1c1fNAMED<-function(FeatureNum,PlotChannel){
  Fi=FeatureNum
  Ci=PlotChannel
  #out<-matrix(0,4,2450)
  
  Si=1
  NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
  cat("N Use line:",NowRowNum,"\n")
  Normal=as.numeric(PlotDATA[NowRowNum,])
  
  Si=2
  NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
  cat("A Use line:",NowRowNum,"\n")
  Acute=as.numeric(PlotDATA[NowRowNum,])
  
  Si=3
  NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
  cat("C Use line:",NowRowNum,"\n")
  Chronic=as.numeric(PlotDATA[NowRowNum,])
  
  out=cbind(Normal,Acute,Chronic)
  #out=data.frame(out=cbind(Normal,Acute,Chronic,pre_seizure))
  return(out)
}



p<-giveDiffSTATE1c1fNAMED(2,1)
boxplot(p,col=rainbow(4))
title(main=Feature[3] , xlab = "Channel:")



#****************************************************
#many plot

windows()
par(mfrow=c(16,8))

for (fi in 1:16) {
  for (ci in 1:8) {
    
    p<-giveDiffSTATE1c1fNAMED(fi,ci)
    boxplot(p,col=rainbow(4))
    title(main=c("FeaNO.",Feature[fi]) , xlab = c("Channel:",ci))
  }
}




#*****************************************2
windows()
par(mfrow=c(3,8))

for (fi in 1:3) {
  for (ci in 1:8) {
    cat(fi," ")
    p<-giveDiffSTATE1c1fNAMED(fi,ci)
    boxplot(p,col=rainbow(4))
    title(main=c("FeaNO.",Feature[fi]) , xlab = c("Channel:",ci))
  }
}






