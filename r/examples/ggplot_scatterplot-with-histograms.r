library(ggplot2)
library(grid)
library(gridExtra)

g <- ggplot(switch.psi,aes(x=Normal,y=Tumor,color=What,shape=Type)) + 
  geom_point() +
  smartas_theme() +
  labs(x="", y="") +
  scale_color_manual(values=c("Tumor no switch"="#7fc97f", "Normal"="#beaed4", "Tumor switch"="#fdc086"))

n <- ggplot(switch.psi,aes(x=Normal, fill=What)) + 
  geom_histogram(alpha=0.75) +
  labs(x="Normal isoform PSI",y="") +
  smartas_theme() +
  scale_fill_manual(values=c("Tumor no switch"="#7fc97f", "Normal"="#beaed4", "Tumor switch"="#fdc086"))

t <- ggplot(switch.psi, aes(x=Tumor, fill=What)) + 
  geom_histogram(alpha=0.75) +
  smartas_theme() +
  labs(x="Tumor isoform PSI",y="") +
  coord_flip() +
  scale_fill_manual(values=c("Tumor no switch"="#7fc97f", "Normal"="#beaed4", "Tumor switch"="#fdc086"))

x <- ggplotGrob(g + theme(legend.position="bottom") + 
                labs(color="",shape="") +
                guides(color=guide_legend(nrow=3,byrow=TRUE,override.aes = list(shape = 15, size = 8)),
                       shape=guide_legend(nrow=2,byrow=TRUE,override.aes = list(size = 8))))$grobs 

legend <- x[[which(sapply(x, function(y) y$name) == "guide-box")]]

p <- grid.arrange(t,g,legend,n,ncol=2,nrow=2, widths=c(1.5,5), heights=c(5,1.5),
                  top=textGrob(paste(gene,niso,tiso,sep=" "),gp=gpar(fontsize=20,font=3)))
