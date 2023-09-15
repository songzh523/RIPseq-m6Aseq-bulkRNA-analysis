suppressMessages(library("DESeq2"))
suppressMessages(library("org.Mm.eg.db"))
suppressMessages(library("genefilter"))
suppressMessages(library(ggplot2)) 
suppressMessages(library(RColorBrewer))
suppressMessages(library(clusterProfiler))
library(ggpubr)
library(openxlsx)
library(Hmisc)
library(openxlsx)

figloc=figlocation
dbloc=databaselocation
datloc=datapath
meloc=m6adatalocation

bninp<-read.table(paste(datloc,"BN-decrease-goenrich_BP-V2.txt",sep=""),sep="\t",header = T)
bninp$xlab=1
bninp1<-bninp[order(bninp$p.adjust),]
ggplot(bninp1, aes(y=Description,x=xlab,fill=-log10(p.adjust))) + scale_y_discrete(limits = rev(bninp1$Description),position = "right")+ geom_tile(colour="white",lwd = 3,linetype =1,height=0.8,width=0.3)+scale_fill_gradient2(low = "#7099CC",mid="#FEFCC2",midpoint = 4.5,high ="#EB5E51" )+theme_void()+ theme(axis.text.y = element_text(size = 12,hjust=0),axis.title = element_text(size = 16),strip.text = element_text(size = 12),axis.text.x=element_blank())+labs(x = "", y = "")

bninp<-read.table(paste(datloc,"P4-decrease-goenrich_BP-used-V2",sep=""),sep="\t",header = T)
bninp$xlab=1
bninp1<-bninp[order(bninp$p.adjust),]
ggplot(bninp1, aes(y=Description,x=xlab,fill=-log10(p.adjust))) + scale_y_discrete(limits = rev(bninp1$Description),position = "right")+ geom_tile(colour="white",lwd = 3,linetype =1,height=0.8,width=0.3)+scale_fill_gradient2(low = "#7099CC",mid="#FEFCC2",midpoint = 6,high ="#EB5E51" )+theme_void()+ theme(axis.text.y = element_text(size = 12,hjust=0),axis.title = element_text(size = 16),strip.text = element_text(size = 12),axis.text.x=element_blank())+labs(x = "", y = "")

