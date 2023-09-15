library("motifStack")
motifplot<-function(inploc,inpnam,figloc,fignam,mainnam){
pcm0 <- read.table(paste(inploc,inpnam,sep="")) 
pcm <- t(pcm0)
rownames(pcm) <- c("A","C","G","U") 
motif <- new("pcm", mat=as.matrix(pcm), name=mainnam)
pdf(paste(figloc,fignam,sep=""))
plot(motif,ylab="bits",ic.scale=FALSE)
dev.off()
}
motifplot(datapath,"input.pcm",resultloc,"motif-m6aall.pdf","M6A")

