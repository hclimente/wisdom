ggplot() + 
  geom_tile(data=subset(test, Significant==0),aes(x=tumor,y=feature,fill=oddsratio), color = "white") +
  geom_tile(data=subset(test, Significant==1),aes(x=tumor,y=feature,fill=oddsratio), color = "black", size=2) +
  scale_fill_gradient2(low = "#2166ac", high = "#d94801", mid = "white", space = "Lab", midpoint=1) +
  smartas_theme() +
  labs(x="Tumor",y="Feature",title="Enrichment test",fill="Odds ratio") +
  theme(legend.position="right") +
  facet_grid(Category ~ ., space = "free", scales="free_y") +
  coord_fixed()
