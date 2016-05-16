geom_bar_significance <- function(categories,ranges,barsize=2, pairAxis=0.5){
  # categories: all factors to be plotted
  # ranges: contains the data for the categories for which an arc will be drawn
  #   category: name of the category
  #   y: height of the two bars

  require(ggplot)
  require(plyr)

  # create base arc
  ## half circunference
  r <- 0.5
  t <- seq(0, 180, by = 1) * pi / 180
  x <- r * cos(t)
  y <- 1 * sin(t)

  ## flatten it, proportionally to the data
  minStep <- max(ranges$y)/40
  y[which(y>minStep)] <- minStep
  modelArc <- data.frame(x = x, y = y)
  
  arcs <- data.frame()
  ast <- data.frame()
  for (x in unique(ranges$category)){
    i <- which(categories==x)
    d <- ddply(ranges[ranges$category==x,],.(variable),summarise,max=max(y))
    j <- max(d$max)
    k <- min(d$max)
    
    this.arc <- data.frame(category=i, x_arc=modelArc$x+(barsize*i-pairAxis), y_arc=modelArc$y+j)
    this.arc <- rbind(this.arc,data.frame(category=i, x_arc=barsize*i, y_arc=k))
    arcs <- rbind(arcs,this.arc)
    
    tmp_ast <- data.frame(category=i,x_ast=barsize*i-pairAxis ,y_ast=j + 1.2*minStep)
    ast <- rbind(ast,tmp_ast)
  }
  
  arcs <- arcs[order(-arcs$x_arc),]
  
  list(geom_text(data=ast ,aes(x=x_ast,y=y_ast,label='*'),size=15),
    geom_line(data=arcs, aes(x_arc,y_arc,group=category))
  
}

geom_boxplot_significance <- function(stat.tests,ranges,rm.outliers=TRUE,categories=cancerTypes){
  
  if (rm.outliers){
    plotRanges <- ddply(ranges, .(Cancer,Categories), summarise, Q1=quantile(y, 1/4), Q3=quantile(y, 3/4), IQR=Q3-Q1, upper.limit=Q3+1.5*IQR)
    plotRanges <- ddply(plotRanges, .(Cancer), summarise, y=max(upper.limit))
  } else {
    plotRanges <- ddply(ranges, .(Cancer), summarise, y=max(y))
  }
  
  minStep <- max(plotRanges$y)/40
  
  r <- 0.25
  t <- seq(0, 180, by = 1) * pi / 180
  x <- r * cos(t)
  y <- minStep * sin(t)
  y[which(y>minStep/2)] <- minStep/2
  modelArc <- data.frame(x = x, y = y)
  
  arcs <- data.frame(Cancer=character(),x_arc=numeric() ,y_arc=numeric())
  ast <- data.frame(Cancer=character(),x_ast=numeric() ,y_ast=numeric())
  for (kns in stat.tests$Cancer[stat.tests$p < 0.05]){
    i <- which(categories==kns)
    j <- max(plotRanges$y[plotRanges$Cancer==kns])
    tmp_arc <- data.frame(Cancer=i, x_arc=modelArc$x+(i), y_arc=modelArc$y+j)
    arcs <- rbind(arcs,tmp_arc)
    
    tmp_ast <- data.frame(Cancer=i,x_ast=i ,y_ast=j + 1.2*minStep)
    ast <- rbind(ast,tmp_ast)
  }
  
  significanceElements <- list("asterisks" = ast, "arcs" = arcs)
  
  return(significanceElements)
  
}
