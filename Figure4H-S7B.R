library(RColorBrewer)
library(ggpubr)
stategenelocation<-function(datloc,mainlab,endloc,startloc,annloc,figloc,refloc){
file=list.files(path = datloc,pattern = ".stats")
filename<-sub(".stats","",file)
for(f in 1:length(file)){
dat<-read.table(paste(datloc,file[f],sep=""))
colnames(dat)<-c("Peak Num","Region")
dat1<-dat[!is.na(dat$Region),]
inp0<-dat1[dat1$Region !="Annotation" & dat1$Region !="Intergenic",]
inp0$Region<-as.character(inp0$Region)
inpa<-inp0
inpa$Region[inp0$Region=="exon" | inp0$Region=="intron" | inp0$Region=="promoter-TSS" | inp0$Region=="TTS" ]="CDS"
inpa$Region[inpa$Region=="non-coding"]="Non-coding"
inp<-aggregate(inpa$`Peak Num`,by=list(inpa$Region),sum)
colnames(inp)<-c("Region","Peak Num")
inp

dat1<-read.table(paste(refloc,"mm10.basic.annotation",sep=""),sep = "\t")
dat1$length=dat1[,endloc]-dat1[,startloc]
dat1$ann=sub("--.*","",sub(" \\(.*","",dat1$V1))
inp0<-dat1[dat1$ann !="Intergenic",]
inp0$ann<-as.character(inp0$ann)
inp1<-inp0
inp1$ann[inp0$ann=="exon" | inp0$ann=="intron" | inp0$ann=="promoter-TSS" | inp0$ann=="TTS" ]="CDS"
inp1$ann[inp1$ann=="non-coding"]="Non-coding"
inp1$ann[inp1$ann=="5 UTR"]="5'UTR"
inp1$ann[inp1$ann=="3 UTR"]="3'UTR"
inp1a<-aggregate(inp1$length,by=list(inp1$ann),mean)
colnames(inp1a)<-c("Region","Length")
inp1a

mergs<-merge(inp,inp1a,by="Region")
mergs$Peak<-((mergs$`Peak Num`/sum(mergs$`Peak Num`))/mergs$Length)*100
mergs$Enrichment<-(mergs$Peak/sum(mergs$Peak))*100
mergs$PeakRatio<-(mergs$`Peak Num`/sum(mergs$`Peak Num`))*100
mergs$Enrich<-mergs$`Peak Num`/mergs$Length
mergs

label <- paste0(mergs$Region, "(", round(mergs$Enrichment,1), "%)")
mergs$label<-label
pie(mergs$Enrichment, border="white", col=brewer.pal(5, "Set3"), label=label,main = filename[f],lwd=10) #col=c("#E3644A","#7FBEE1","#A5D38A","#F9E28C")
p2<-ggbarplot(mergs, "Region", "Enrich",xlab="",ylab="Enrichment",fill="Region",color="white")+scale_fill_manual(values =brewer.pal(5, "Set3"))+theme(legend.position='none')
print(p2)
}
}


figloc=figloc
refloc=refloc
stategenelocation(datapath,"M6A",4,3,8,figloc,refloc)
stategenelocation(datapath,"RIP",4,3,8,figloc,refloc)
