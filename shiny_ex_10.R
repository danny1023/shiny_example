library(shiny)

server <- function(input, output){
  output$table <- renderTable({
    head(iris)
  })
}

ui <- flowLayout(
  #从左到右，从上到下，自适应窗口排列
  sliderInput('slider', 'Slider', min = 1, max = 100, value = 50),
  textInput('text', 'Text'),
  tableOutput('table')
)

shinyApp(ui, server)