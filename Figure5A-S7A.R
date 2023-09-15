library(Guitar)
library(ggplot2)
peakbodyplot<-function(setBedFiles,refloc1,groupnam,figloc,mainlab){
  txdb <- makeTxDbFromGFF(file = paste(refloc1,"genes.gtf",sep=""),
                          format="gtf",
                          dataSource="Ensembl",
                          organism="Mus musculus")
  p<-GuitarPlot(txTxdb = txdb,
             stBedFiles = stBedFiles,
             headOrtail = FALSE,
             enableCI = FALSE,txMrnaComponentProp = c(0.2,0.2,0.2,0.2,0.2),
             mapFilterTranscript = TRUE,
             pltTxType = c("mrna"),
             stGroupName =groupnam)
  p1 <- p+theme_classic()+scale_fill_manual(values = rep("white",length(stBedFiles)))+ ggtitle(label = "") +labs(x="")+labs(y="Peaks (%)") +theme(plot.title = element_text(hjust = 0.5))+scale_alpha_manual(0.1)
  pdf(paste(figloc,mainlab,"-genebody.pdf",sep=""))
  print(p1)
  dev.off()
}

peakloc=peaklocation
refloc1=reflocation
figloc=figurelocation
mainlab=titlename
bed1 <-paste(peakloc,"M6A1_summits-sub.bed",sep="")
bed2 <-paste(peakloc,"M6A2_summits-sub.bed",sep="")
bed3 <-paste(peakloc,"M6A3_summits-sub.bed",sep="")
stBedFiles <-list(bed1,bed2,bed3)
groupnam<-c("M6A1","M6A2","M6A3")
peakbodyplot(setBedFiles,refloc1,groupnam,figloc,mainlab)


bed1 <-paste(peakloc,"HA_summits-sub.bed",sep="")
bed2 <-paste(peakloc,"WT_summits-sub.bed",sep="")
stBedFiles <-list(bed1,bed2)
groupnam<-c("HA","WT")
peakbodyplot(setBedFiles,refloc1,groupnam,figloc,mainlab)

