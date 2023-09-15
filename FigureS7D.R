library(ggpubr)

p0<-ggscatter(inps,"M6A","RIP",xlim=c(-6,6),color="significant",size=1,xlab = "log2FC(M6A)",ylab = "log2FC(RIP)")+theme_bw(base_size = 20)+theme(legend.position='none',panel.grid =element_blank())+scale_color_manual(values=c("#B0DA3F","#DD2B19","#5EB1DB","#AEAEAE","#FBC000"))+geom_hline(aes(yintercept=0))+geom_vline(aes(xintercept=0))+labs(x="m6A modification (log2FC)",y="RIP (log2FC)")
p1<-p0+annotate("text", x=5, y=5, label=paste("m6A RIP UP:",table(inps$significant)[2]))+annotate("text", x=-5, y=-6, label=paste("m6A RIP DOWN:",table(inps$significant)[1]))+annotate("text", x=-5, y=5, label=paste("only RIP UP:",table(inps$significant)[5]))+annotate("text", x=5, y=-6, label=paste("only m6A UP:",table(inps$significant)[3]))
print(p1)
