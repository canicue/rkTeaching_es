kurtosisTable <- function(x){
	t<-as.data.frame(table(x))
	ni<-t$Freq
	n<-sum(ni)
	nf<-length(ni)
	z<-rep(0,6*nf)
	dim(z)<-c(nf,6)
	z[,1]<-as.numeric(as.character(t$x))
	z[,2]<-ni
	z[,3]<-z[,1]*z[,2]
	z[,4]<-z[,1]^2*z[,2]
	m<-sum(z[,3])/sum(z[,2])
	z[,5]<-z[,1]-m
	z[,6]<-z[,5]^4*z[,2]
	z<-rbind(z,c("Suma", sum(z[,2]), sum(z[,3]), sum(z[,4]),"",sum(z[,6])))
	colnames(z)<-c("xi","ni","xi*ni","xi^2*ni","xi-mean","(xi-mean)^4*ni")
	rownames(z)<-c(as.character(rep("",nf)),"Sum")
	return(z)
}