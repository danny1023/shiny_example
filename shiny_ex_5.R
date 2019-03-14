library(shiny)

server <- function(input, output){
  output$display <- renderPlot({
    hist(rnorm(input$sampleSize), main = input$main_title)
  })
}

ui <- fluidPage(
  titlePanel(title = 'Shiny Optional exercise'),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = 'sampleSize', label = 'Size', min = 10, max = 100, value = 50, step = 1),
      textInput(inputId = 'main_title', label = 'Plot Title', value = 'example')
    ),
    mainPanel(
      plotOutput('display')
    )
  )
)

shinyApp(ui = ui, server = server)