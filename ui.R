library(shiny)

shinyUI(fluidPage
(

  # Application title
  titlePanel("K-Means Clustering"),

  # Sidebar with a slider input for number of bins
  sidebarLayout
  (
    sidebarPanel
    (
      h3('Parameters'),
      p("This application let's you experiment with the k-means clustering algorithm in R.
        With the first slider you can generate between 50 and 500 new data points. The second slider let's
        you set the number of clusters. The server will generate a new point cloud and clusters it automatically
        whenever one of the slider is moved."),
      sliderInput
      (
        "points",
        "Number of data points",
        min = 50,
        max = 500,
        value = 100
      ),
      sliderInput
      (
        "clusters",
        "Number of clusters",
        min = 2,
        max = 8,
        value = 4
      )
      
      ),
    

    # Show a plot of the generated distribution
    mainPanel
    (
      h3('Clustered plot'),
      plotOutput("colorPlot")
    )
  )
))