suppressMessages(library("DESeq2"))
suppressMessages(library("org.Mm.eg.db"))
suppressMessages(library("genefilter"))
suppressMessages(library(ggplot2)) 
suppressMessages(library(RColorBrewer))
suppressMessages(library(clusterProfiler))
library(ggpubr)
library(openxlsx)
library(Hmisc)

figloc=figlocation
dbloc=databaselocation
datpath=datapath
#########FigureS7F
res<-read.csv(paste(datpath,"P4-result-significant.csv",sep = ""),row.names = 1) #P0Cortex-result.csv

ups<-rownames(res)[as.character(res$sig)=="Up"]
downs<-rownames(res)[as.character(res$sig)=="Down"]
res1<-na.omit(res)
res2 <- res1[order(res1$padj),]
results = res2
results$logp<-(-log10(results$pvalue))

testinp0<-as.data.frame(table(res$sig))
testinp<-testinp0[testinp0$Var1 %in% c("Up","Down"),]
colnames(testinp)<-c("Significant","Number")
testinp1<-testinp[c(2,1),]
p0<-ggscatter(results,xlim=c(-2,2.5),ylim=c(0,15),"log2FoldChange","logp",color="sig",size = 0.8, palette = c("#38436C", "gray","gray","#A02622"),legend = "none",font.label=c(15,"black"),ylab = "-log10(p value)")+ theme(axis.title.x = element_text(size = 15),axis.title.y = element_text(size = 15),axis.text.x  = element_text(size = 13))+geom_vline(xintercept = c(0.2,-0.2),lty=2,col="gray",lwd=1)+geom_hline(yintercept = 1.30103,lty=2,col="gray",lwd=1)
p1<-ggtexttable(testinp1, rows = NULL, theme = ttheme("light"))
print(p0 + annotation_custom(ggplotGrob(p1),xmin = -2, ymin = 11,xmax = -1))
#########FigureS7G
exp1<-read.table(paste(datpath,"P4-DESeq2.normalization-removebatch.txt",sep=""),row.names = 1)
usedexp1<-exp1[rownames(exp1) %in% unique(c(ups,downs)),]
ann_colors = list(Treatment = c(CKO ="#ecb731", WT ="#4298b5"))
annotation_col = data.frame(
  Treatment = factor(sub("[0-9]","",colnames(usedexp1))))
rownames(annotation_col) = colnames(usedexp1)
pheatmap(usedexp1,show_colnames = F,show_rownames = F, annotation_col = annotation_col, border=FALSE,annotation_colors = ann_colors,scale = "row",treeheight_row =F,treeheight_col = F)
