#*For fyp Scott
#*
#*2022.12.17
#*
#*Do plot 
#*
#*TYPE: 6 features
#*
#*3 class



# data

plotFt1<-read.table("plotFt1.txt",sep=",")
plotFt2<-read.table("plotFt2.txt",sep=",")
plotFt3<-read.table("plotFt3.txt",sep=",")
plotFt4<-read.table("plotFt4.txt",sep=",")
plotFt5<-read.table("plotFt5.txt",sep=",")
plotFt6<-read.table("plotFt6.txt",sep=",")
plotFt7<-read.table("plotFt7.txt",sep=",")
plotFt8<-read.table("plotFt8.txt",sep=",")
plotFt9<-read.table("plotFt9.txt",sep=",")
plotFt10<-read.table("plotFt10.txt",sep=",")

#*****************************************************************
# one channel one graph ----------Different state, One feature
Feature=c(1:16)
state=c("1 day before SC","30min before SC","20 min before SC",
        "10min before SC","10min before DZP injection",
        "10min after DZP injection","1h after DZP injection",
        "2h after DZP injection","3h after DZP injection",
        "1 day after SC")
PlotDATA=rbind(plotFt1,plotFt2,plotFt3,plotFt4,plotFt5
               ,plotFt6,plotFt7,plotFt8,plotFt9,plotFt10)
Cname=c("CA1(L)","CA1(R)","CA3(L)","CA3(R)","Reference Channel1",
        "Reference Channel2","DG(L)","DG(R)")



#New
StateNum=10
datalength=length(plotFt1[1,])

#______________________________________________
#______________________________________________
#________________ggplot2_______________________
#______________________________________________
#______________________________________________
giveggPlot<-function(FeatureNum,PlotChannel){
  Fi=FeatureNum
  Ci=PlotChannel
  out<-matrix(0,datalength*StateNum,2)
  
  
  for (Si in 1:StateNum) {
    NowRowNum=(Si-1)*48+1+(Fi-1)*8+(Ci-1)
    cat("State",Si,state[Si],"\n\t\t\t\t\t\tUse line:",NowRowNum,"\n")
    NowD=as.numeric(PlotDATA[NowRowNum,])
    out[((Si-1)*datalength+1):(Si*datalength),1]=NowD
    out[((Si-1)*datalength+1):(Si*datalength),2]=rep(Si,datalength)
  }
  colnames(out)<-c("ggdata","label")
  
  #out[,2]=as.factor(out[,2])
  return(out)
}


#Func END

library(ggplot2)

library(gcookbook)
p<-giveggPlot(2,1)
p<-as.data.frame(p)
p$label<-as.factor(p$label)
names(p)
head(p)

#plot__________________________TEST_________________________
pplot <- ggplot(p, aes(x =label, y =ggdata)) +
  geom_boxplot(aes(fill=label))+#aes(fill=label)
  labs(title="", x="", y = "", fill = "states")+
  scale_x_discrete(labels=state)+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

  
pplot + scale_fill_brewer(palette = "Set3")+
  scale_y_continuous(limits = c(-5,5))




#_______________PLOT__________ALL_____________


for (fi in 1:16) {
  for (ci in 1:8) {
    p<-giveggPlot(fi,ci)
    p<-as.data.frame(p)
    p$label<-as.factor(p$label)
    
    pp<-ggplot(p, aes(x =label, y =ggdata)) +
      geom_boxplot(aes(fill=label))+#color="blue"
      labs(title=paste0("Rat19-",Cname[ci]), x= "", y =paste0("Feature_",Feature[fi]),
           fill = "states")+
      scale_x_discrete(labels=state)+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))+
      scale_y_continuous(limits = c(-5,5))
    
    pp#scale_fill_brewer(palette = "Set3")
    
    ggsave(filename = paste0("Box_Feature_",Feature[fi],"_Channel",ci,"_",Cname[ci],".jpg"))
  }
}

















