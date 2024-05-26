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


plot0<-read.table("plotw0all.txt",sep=",")
plot1<-read.table("plotf1all.txt",sep=",")
plot2<-read.table("plotm3all.txt",sep=",")
plot3<-read.table("plotq2all.txt",sep=",")

#*****************************************************************
# one channel one graph ----------Different state, One feature
Feature=c(1:16)
state=c("Normal","Acute","Chronic","pre-seizure")
PlotDATA=rbind(plot0,plot1,plot2,plot3)
Cname=c("CA1(L)","CA1(R)","CA3(L)","CA3(R)","Reference Channel1",
        "Reference Channel2","DG(L)","DG(R)")



#New
StateNum=4
datalength=length(plot1[1,])

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

  
pplot + scale_fill_brewer(palette = "Set3")



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
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    pp#scale_fill_brewer(palette = "Set3")
    
    ggsave(filename = paste0("Box_Feature_",Feature[fi],"_Channel",ci,"_",Cname[ci],".jpg"))
  }
}

















