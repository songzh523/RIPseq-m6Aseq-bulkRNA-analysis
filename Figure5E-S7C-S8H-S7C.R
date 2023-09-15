suppressMessages(library(ggplot2)) 
suppressMessages(library(RColorBrewer))
library(ggpubr)
library(VennDiagram)


ventwoplots<-function(a,b,anam,bnam){
grid.newpage()  
venn.plot <- draw.triple.venn(area1 = length(a),area2 = length(b),n12 = length(a[a %in% b]),category = c(anam, bnam),cat.col=c("red","blue"),col=c("red","blue"))
grid.draw(venn.plot)
}
venthreeplots<-function(a,b,c,anam,bnam,cnam){
grid.newpage()  
venn.plot <- draw.triple.venn(area1 = length(a),area2 = length(b),area3 = length(c),n12 = length(a[a %in% b]),n23 = length(b[b %in% c]),n13 = length(c[c %in% a]),n123 = length(b[b %in% a & b %in% c]),category = c(anam, bnam, cnam),cat.col=c("red","blue","black"),col=c("red","blue","black"))
grid.draw(venn.plot)
}
venthreeplots(m6asig,ripsig,downs,"m6A","RIP","Down")
venthreeplots(m6asig,ripsig,ups,"m6A","RIP","Up")
ventwoplots(m6asig,ripsig,"m6A","RIP")
