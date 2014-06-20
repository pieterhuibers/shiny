library(shiny)

allColors = c("black", "green", "yellow","red","blue","cyan","magenta","orange")

shinyServer(function(input, output) {

  output$colorPlot <- renderPlot({
    n <- input$points
    clusters <- input$clusters

    # generate random data points (x,y)
    x <- rnorm(n)
    y <- rnorm(n)
    d <- data.frame(x,y)
    fit <- kmeans(d, clusters)
    aggregate(d,by=list(fit$cluster),FUN=mean)
    d <- data.frame(d, fit$cluster)
    colors <- cut(d$fit.cluster, clusters, allColors[1:clusters])
    d <- data.frame(d, colors)

    plot(d$x,d$y,xlab="x", ylab="y", col = as.character(d$colors), pch = 16)
  })

})
