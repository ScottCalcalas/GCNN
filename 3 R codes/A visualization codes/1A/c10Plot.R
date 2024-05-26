

#*For fyp Scott
#*
#*2022.11.29
#*
#*Do plot 
#*
#*TYPE: 16 features
#*
#*4 class


#*normal 0
#*acute 1
#*chronic 3

Feature=c(1:16)
state=c("Normal","Acute","Chronic","pre-seizure")
#         w0     f1       m3        q4


# data

plotw0all<-read.table("plotw0all.txt",sep=",")
plotf1all<-read.table("plotf1all.txt",sep=",")
plotm3all<-read.table("plotm3all.txt",sep=",")
plotq4all<-read.table("plotq2all.txt",sep=",")


# function

giveFsingle<-function(Nowdata, Feai){
  i=Feai
  Rstart=(i-1)*8+1
  Rend=i*8
  output=Nowdata[Rstart:Rend,]
  output=t(output)
  return(output)
}  


givePsingle<-function(Nowdata, Feai,PlotChannel){
  i=Feai
  Rstart=(i-1)*8+1
  Rend=i*8
  output=Nowdata[Rstart:Rend,]
  output=output[PlotChannel,]
  output=t(output)
  return(output)
}

#Example
#givePsingle(plotf1all,2,1)[1:10]





##Plot test

f1=giveFsingle(plotf1all,2)
windows()
boxplot(f1,col=rainbow(8), xaxt = "n", yaxt ="n", bty = "n")
title(main= 'Test', sub = "yy", xlab = "Channel", ylab = "Feature")

boxplot(f1,col=rainbow(8), xaxt = "n", yaxt ="2", bty = "n")#nO BTY


#For look
f1=giveFsingle(plotf1all,1)
boxplot(f1,col=rainbow(8))
title(main= 'Acute', xlab = "Channel", ylab = Feature[1])

#*******************************
# one channel one graph ----------One STATE, different feature
giveINoneChannel<-function(Nowdata,PlotChannel){
  out<-matrix(0,2450,16)
  for (i in 1:6) {
    out[,i]=givePsingle(Nowdata,i,PlotChannel)
  }
  return(out)
}

aa<-giveINoneChannel(plotw0all,1)

boxplot(aa,col=rainbow(8))
title(main= state[1], xlab = "Features")





#*****************************************************************
# one channel one graph ----------Different state, One feature
Feature=c("ApEn","SampEn","PE","FuzzEn","KC","SE")
#         1       2       3     4       5     6
state=c("Normal","Acute","Chronic","pre_seizure")
PlotDATA=rbind(plotw0all,plotf1all,plotm3all,plotq4all)


giveDiffSTATE1c1f<-function(FeatureNum,PlotChannel){
  Fi=FeatureNum
  Ci=PlotChannel
  out<-matrix(0,4,2450)
  for (Si in 1:4) {#4:Sates number
    NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
    out[Si,]=as.numeric(PlotDATA[NowRowNum,])
    
  }
  
  return(t(out))
}

giveDiffSTATE1c1fNAMED<-function(FeatureNum,PlotChannel){
  Fi=FeatureNum
  Ci=PlotChannel
  #out<-matrix(0,4,2450)
  
  Si=1
  NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
  Normal=as.numeric(PlotDATA[NowRowNum,])
  
  Si=2
  NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
  Acute=as.numeric(PlotDATA[NowRowNum,])
  
  Si=3
  NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
  Chronic=as.numeric(PlotDATA[NowRowNum,])
  
  Si=4
  NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
  pre_seizure=as.numeric(PlotDATA[NowRowNum,])
  
  out=cbind(Normal,Acute,Chronic,pre_seizure)
  #out=data.frame(out=cbind(Normal,Acute,Chronic,pre_seizure))
  return(out)
}



p<-giveDiffSTATE1c1fNAMED(1,2)
boxplot(p,col=rainbow(4))
title(main=Feature[1] , xlab = "Channel:2")

a


















#******************************************************************
# Multi-plot
Feature=c(1:16)
state=c("Normal","Acute","Chronic","pre-seizure")
#         w0     f1       m3        q4


# data

plotw0all<-read.table("plotw0all.txt",sep=",")
plotf1all<-read.table("plotf1all.txt",sep=",")
plotm3all<-read.table("plotm3all.txt",sep=",")
plotq4all<-read.table("plotq2all.txt",sep=",")

PlotDATA=rbind(plotw0all,plotf1all,plotm3all,plotq4all)

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
  
  Si=4
  NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
  cat("P Use line:",NowRowNum,"\n")
  pre_seizure=as.numeric(PlotDATA[NowRowNum,])
  
  
  out=cbind(Normal,Acute,Chronic,pre_seizure)
  #out=data.frame(out=cbind(Normal,Acute,Chronic,pre_seizure))
  return(out)
}


#****************************************************
#many plot

windows()
par(mfrow=c(16,8))

for (fi in 1:16) {
  for (ci in 1:8) {
    
    p<-giveDiffSTATE1c1fNAMED(fi,ci)
    boxplot(p,col=rainbow(4))
    title(main=Feature[fi] , xlab = c("Channel:",ci))
  }
}



#***********************************************2
#many plot

windows()
par(mfrow=c(3,8))

for (fi in 15:16) {
  for (ci in 1:8) {
    
    p<-giveDiffSTATE1c1fNAMED(fi,ci)
    boxplot(p,col=rainbow(4))
    title(main=c("FeaNO.",Feature[fi]) , xlab = c("Channel:",ci))
  }
}













