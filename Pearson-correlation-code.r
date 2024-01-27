
#temperature and NDVI value Call
temp<-read.csv('E:/Research/Tanuja Journal/Correlation_Data/temperature_file_for_correlation.csv')
ndvi<-read.csv('E:/Research/Tanuja Journal/Correlation_Data/MONTHLY_NDVI_for_correlation.csv')



#blank list file
x3<-list()
 

for (i in 1:length(temp[,2])){
  x1<-temp[i,4:length(temp)]
  tx1<-as.data.frame(t(x1))
  x4<-ndvi[i,3:length(ndvi)]
  tx4<-as.data.frame(t(x4))
  x2<-cor(tx1,tx4, method='pearson',use = "pairwise.complete.obs")
  x3[[i]]<-x2
  
}
value<-t(as.data.frame(x3))

cod<-ndvi$Station.No
head(value)
rownames(value)<-rownames(cod)
mat<-cbind(cod,value)
head(mat)
setwd('E:/Research/Tanuja Journal/Correlation_Data')
write.csv(mat,'correlation_results.csv')

