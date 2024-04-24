# Network Analysis Project

# Load required packages
library(shiny)
library(igraph)

# Define UI
ui <- fluidPage(
  titlePanel("Dynamic Network Visualization"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("num_vertices", "Number of Vertices", min = 5, max = 50, value = 10)
    ),
    mainPanel(
      plotOutput("networkPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Generate dynamic graph data
  dynamic_graph <- reactive({
    num_vertices <- input$num_vertices
    graph <- erdos.renyi.game(num_vertices, p = 0.2)  # Generate a random graph
    return(graph)
  })
  
  # Render network plot
  output$networkPlot <- renderPlot({
    plot(dynamic_graph(), layout = layout_with_fr(dynamic_graph()))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
