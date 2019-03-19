library(shiny)

server <- function(input, output){
  output$table <- renderTable({
    head(iris)
  })
}

ui <- verticalLayout(
  #从上到下固定罗列
  sliderInput('slider', 'Slider', min = 1, max = 100, value = 50),
  textInput('text', 'Text'),
  tableOutput('table')
)

shinyApp(ui, server)