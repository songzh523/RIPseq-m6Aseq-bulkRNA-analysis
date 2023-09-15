clevelandplot<-function(wtp,cols){
  ggpubr::ggdotchart(wtp, x = "symbol", y = "type",color="updown",dot.size="logp", palette = c("#00AFBB", "#E7B800", "#FC4E07"),sorting = "descending",rotate = TRUE)+scale_color_manual(values=cols)+theme_bw() +
    theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.border = element_rect(colour = "black",size = 2),panel.background = element_blank())
} 

cols<-c("red","blue","gray")
clevelandplot(expused,cols)
